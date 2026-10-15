# Builds man/figures/logo.{svg,png} and pkgdown/favicon/*.
# Needs: pip install fonttools pillow; Chromium (set CHROME to its path).
import json, os, shutil, subprocess, tempfile
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen
from fontTools.ttLib import TTFont
from PIL import Image

CHROME = os.environ.get("CHROME", "chromium")
FONT = os.environ.get("LOGO_FONT", "/usr/share/fonts/opentype/inter/InterDisplay-ExtraBoldItalic.otf")
PURPLE, INK = "#6d28d9", "#4c1d95"
HEX = "259,6 512,153 512,447 259,594 6,447 6,153"
GRAD = ('<linearGradient id="g" x1="0" y1="0" x2="0.6" y2="1"><stop offset="0" stop-color="#ffffff"/>'
        '<stop offset="0.55" stop-color="#e0f2fe"/><stop offset="1" stop-color="#bae6fd"/></linearGradient>')

def wordmark(text="iconifyr", width=370, baseline=468):
    f = TTFont(FONT); gs = f.getGlyphSet(); cmap = f.getBestCmap()
    x, names = 0, []
    for ch in text:
        n = cmap[ord(ch)]; names.append((n, x)); x += gs[n].width
    sc = width / x; pen = SVGPathPen(gs)
    for n, xx in names:
        gs[n].draw(TransformPen(pen, (sc, 0, 0, -sc, 259 - width / 2 + xx * sc, baseline)))
    return f'<path d="{pen.getCommands()}" fill="{INK}"/>'

def lens():
    tiles = "".join(
        f'<rect x="{190+c*54}" y="{185+r*54}" width="42" height="42" rx="10" fill="{"#f59e0b" if (r,c)==(1,0) else PURPLE}"/>'
        for r in range(2) for c in range(2))
    return (f'<circle cx="240" cy="235" r="105" fill="#fff" stroke="{PURPLE}" stroke-width="26"/>'
            f'<line x1="318" y1="313" x2="400" y2="395" stroke="{PURPLE}" stroke-width="34" stroke-linecap="round"/>{tiles}')

def hexagon(): return f'<polygon points="{HEX}" fill="url(#g)" stroke="{PURPLE}" stroke-width="14" stroke-linejoin="round"/>'

def render(svg, out, w, h):
    with tempfile.TemporaryDirectory() as d:
        open(f"{d}/a.svg", "w").write(svg)
        open(f"{d}/a.html", "w").write(f"<body style='margin:0;background:transparent'><img src=a.svg width={w} height={h}>")
        subprocess.run([CHROME, "--headless", "--no-sandbox", "--hide-scrollbars", "--default-background-color=00000000",
                        f"--screenshot={d}/o.png", f"--window-size={w+50},{h+200}", f"file://{d}/a.html"], check=True, capture_output=True)
        Image.open(f"{d}/o.png").crop((0, 0, w, h)).save(out)

def doc(body, vb, w, h): return f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="{vb}" width="{w}" height="{h}"><defs>{GRAD}</defs>{body}</svg>'

logo = doc(hexagon() + f'<g transform="translate(0 -42)">{lens()}</g>' + wordmark(), "0 0 518 600", 518, 600)
open("man/figures/logo.svg", "w").write(logo)
render(logo, "man/figures/logo.png", 240, 278)

# Favicon mark: hexagon + lens, no wordmark.
mark = hexagon() + f'<g transform="translate(259 300) scale(1.25) translate(-259 -223)">{lens()}</g>'
sq = doc(f'<g transform="translate(300 300) scale(0.94) translate(-300 -300) translate(41 0)">{mark}</g>', "0 0 600 600", 600, 600)
op = doc(f'<rect width="600" height="600" fill="#f5f3ff"/><g transform="translate(60 60) scale(0.8)"><g transform="translate(41 0)">{mark}</g></g>', "0 0 600 600", 600, 600)
d = "pkgdown/favicon"; shutil.rmtree(d, ignore_errors=True); os.makedirs(d)
open(f"{d}/favicon.svg", "w").write(sq)
render(sq, f"{d}/favicon-96x96.png", 96, 96)
for name, s in [("apple-touch-icon.png", 180), ("web-app-manifest-192x192.png", 192), ("web-app-manifest-512x512.png", 512)]:
    render(op, f"{d}/{name}", s, s)
with tempfile.TemporaryDirectory() as t:
    render(sq, f"{t}/f.png", 48, 48)
    Image.open(f"{t}/f.png").save(f"{d}/favicon.ico", sizes=[(16, 16), (32, 32), (48, 48)])
json.dump({"name": "iconifyr", "short_name": "iconifyr",
           "icons": [{"src": "web-app-manifest-192x192.png", "sizes": "192x192", "type": "image/png", "purpose": "any"},
                     {"src": "web-app-manifest-512x512.png", "sizes": "512x512", "type": "image/png", "purpose": "any"}],
           "theme_color": PURPLE, "background_color": "#f5f3ff", "display": "standalone"},
          open(f"{d}/site.webmanifest", "w"), indent=2)
