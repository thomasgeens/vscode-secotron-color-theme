const fs = require("fs");
const path = require("path");
const { parse, printParseErrorCode } = require("jsonc-parser");

// VS Code color values: #RGB, #RGBA, #RRGGBB, #RRGGBBAA
const HEX_COLOR = /^#([0-9A-Fa-f]{3,4}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/;

const THEMES = [
  {
    label: "SECOTRON",
    file: "../themes/SECOTRON-color-theme.json",
    type: "dark",
  },
  {
    label: "SECOTRON Dark",
    file: "../themes/SECOTRON-dark-color-theme.json",
    type: "dark",
  },
  {
    label: "SECOTRON Light",
    file: "../themes/SECOTRON-light-color-theme.json",
    type: "light",
  },
];

function loadTheme(file) {
  const raw = fs.readFileSync(path.resolve(__dirname, file), "utf8");
  const errors = [];
  const theme = parse(raw, errors);
  return { theme, errors };
}

describe.each(THEMES)("$label theme", ({ file, type }) => {
  test("parses without errors", () => {
    const { errors } = loadTheme(file);
    const messages = errors.map(
      (e) => `${printParseErrorCode(e.error)} at offset ${e.offset}`,
    );
    expect(messages).toEqual([]);
  });

  test("has required top-level fields", () => {
    const { theme } = loadTheme(file);
    expect(theme.type).toBe(type);
    expect(typeof theme.colors).toBe("object");
    expect(Array.isArray(theme.tokenColors)).toBe(true);
  });

  test("all editor colors are valid hex values", () => {
    const { theme } = loadTheme(file);
    const invalid = [];
    for (const [key, value] of Object.entries(theme.colors)) {
      if (value !== null && !HEX_COLOR.test(value)) {
        invalid.push(`${key}: "${value}"`);
      }
    }
    expect(invalid).toEqual([]);
  });

  test("all token color foreground values are valid hex", () => {
    const { theme } = loadTheme(file);
    const invalid = [];
    for (const token of theme.tokenColors) {
      const fg = token?.settings?.foreground;
      if (fg !== undefined && !HEX_COLOR.test(fg)) {
        invalid.push(
          `scope "${token.scope ?? "(unnamed)"}" foreground: "${fg}"`,
        );
      }
    }
    expect(invalid).toEqual([]);
  });
});

test("all themes are registered in package.json", () => {
  const pkg = require("../package.json");
  const registered = (pkg.contributes?.themes ?? []).map((t) => t.path);
  for (const { file } of THEMES) {
    const pkgPath = "./" + path.relative(path.resolve(__dirname, ".."), path.resolve(__dirname, file));
    expect(registered).toContain(pkgPath);
  }
});
