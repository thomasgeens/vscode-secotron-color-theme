const fs = require("fs");
const path = require("path");
const { parse, printParseErrorCode } = require("jsonc-parser");

const THEME_PATH = path.resolve(
  __dirname,
  "../themes/SECOTRON-color-theme.json",
);

function loadTheme() {
  const raw = fs.readFileSync(THEME_PATH, "utf8");
  const errors = [];
  const theme = parse(raw, errors);
  return { theme, errors };
}

// VS Code color values: #RGB, #RGBA, #RRGGBB, #RRGGBBAA
const HEX_COLOR = /^#([0-9A-Fa-f]{3,4}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/;

describe("SECOTRON color theme", () => {
  test("theme file parses without errors", () => {
    const { errors } = loadTheme();
    const messages = errors.map(
      (e) => `${printParseErrorCode(e.error)} at offset ${e.offset}`,
    );
    expect(messages).toEqual([]);
  });

  test("theme has required top-level fields", () => {
    const { theme } = loadTheme();
    expect(theme.type).toMatch(/^(dark|light|hc-dark|hc-light)$/);
    expect(typeof theme.colors).toBe("object");
    expect(Array.isArray(theme.tokenColors)).toBe(true);
  });

  test("all editor colors are valid hex values", () => {
    const { theme } = loadTheme();
    const invalid = [];
    for (const [key, value] of Object.entries(theme.colors)) {
      if (value !== null && !HEX_COLOR.test(value)) {
        invalid.push(`${key}: "${value}"`);
      }
    }
    expect(invalid).toEqual([]);
  });

  test("all token color settings have valid hex foreground values", () => {
    const { theme } = loadTheme();
    const invalid = [];
    for (const token of theme.tokenColors) {
      const fg = token?.settings?.foreground;
      if (fg !== undefined && !HEX_COLOR.test(fg)) {
        invalid.push(`scope "${token.scope ?? "(unnamed)"}" foreground: "${fg}"`);
      }
    }
    expect(invalid).toEqual([]);
  });

  test("theme is registered in package.json", () => {
    const pkg = require("../package.json");
    const themes = pkg.contributes?.themes ?? [];
    const registered = themes.some(
      (t) => t.path === "./themes/SECOTRON-color-theme.json",
    );
    expect(registered).toBe(true);
  });
});
