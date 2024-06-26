#!/usr/bin/env -S deno run -A
// horrible script because i'm too lazy to update casks manually
import $ from "https://deno.land/x/dax@0.39.1/mod.ts";

const HIKARI_UPLOAD = Deno.env.get("HIKARI_UPLOAD")!;

interface Cask {
  name: string;
  repo: string;
  filter: string;
  lines: {
    version: number;
    sha256: number;
    url: number;
  };
}

interface Artifact {
  name: string;
  archive_download_url: string;
}

const CASKS: Cask[] = [
  {
    name: "aegisub-japan7",
    repo: "odrling/Aegisub",
    filter: "macOS (arm64)",
    lines: {
      version: 3,
      sha256: 4,
      url: 11,
    },
  },
  {
    name: "aegisub-japan7",
    repo: "odrling/Aegisub",
    filter: "macOS (amd64)",
    lines: {
      version: 7,
      sha256: 8,
      url: 11,
    },
  },
  {
    name: "syncplay-japan7",
    repo: "odrling/syncplay",
    filter: ".dmg",
    lines: {
      version: 2,
      sha256: 3,
      url: 5,
    },
  },
];

for (const cask of CASKS) {
  updateCask(cask);
}

async function updateCask(cask: Cask) {
  const { archive, sha256, installer } = await getLatest(cask);
  const url = await hikari(archive, `${installer}.zip`);
  await Deno.remove(archive);
  const version = url.split("/")[4];
  await updateFile(cask, {
    version,
    sha256,
    url: url.replace(version, "#{version}"),
  });
}

async function getLatest(cask: Cask) {
  const json: { artifacts: Artifact[] } =
    await $`gh api /repos/${cask.repo}/actions/artifacts`.json();
  const last = json.artifacts.find((a) => a.name.includes(cask.filter));

  const archive = `${crypto.randomUUID()}.zip`;
  await $`gh api ${last?.archive_download_url}`.stdout($.path(archive));
  const sha256 = await $`shasum -a 256 ${archive} | cut -d ' ' -f 1`.text();

  const files = await $`zipinfo -1 ${archive}`.lines();
  const installer = files.find((f) => f.endsWith(".dmg"))!;

  return { archive, sha256, installer };
}

async function hikari(archive: string, name: string) {
  const bin = await Deno.readFile(archive);
  const blob = new Blob([bin], { type: "application/zip" });
  const form = new FormData();
  form.append("file", blob, name);
  const resp = await fetch(HIKARI_UPLOAD, {
    method: "POST",
    body: form,
  });
  const json = await resp.json();
  return json.url as string;
}

async function updateFile(
  cask: Cask,
  props: { version: string; sha256: string; url: string }
) {
  let content = await Deno.readTextFile(`Casks/${cask.name}.rb`);
  const lines = content.split("\n");
  // :puke:
  for (const [key, value] of Object.entries(props)) {
    const nline = cask.lines[key as keyof Cask["lines"]] - 1;
    lines[nline] = lines[nline].replace(
      new RegExp(`${key} ".*"`),
      `${key} "${value}"`
    );
  }
  content = lines.join("\n");
  await Deno.writeTextFile(`Casks/${cask.name}.rb`, content);
}
