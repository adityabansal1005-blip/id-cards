# NFC Digital Cards

One file runs every card. Each person gets a URL like `yoursite.vercel.app/theirname`.

## Add a new card (60 seconds)

1. Open **`index.html`**, find the `CARDS = {` block near the top.
2. Copy the whole **`"sample": { ... }`** block (including the comma).
3. Change `"sample"` to their name/slug — this becomes the URL:
   `"rahul"` → `yoursite.vercel.app/rahul`
4. Fill in their details (name, role, phone, email, socials, colours).
5. Drop their photo into **`img/`** and point `photo:` at it, e.g. `"img/rahul.jpg"`.
6. Push:
   ```
   git add .
   git commit -m "add rahul card"
   git push
   ```
   Vercel redeploys in ~20 seconds. Done.

## Field notes

| Field | What it does |
|---|---|
| `brand` | Main band colour (top + bottom). Any hex. |
| `gold` | Accent colour — rules, icons, borders. |
| `logo` | Path to logo image. Leave `""` to show only the typed wordmark. |
| `logoBlend` | `true` if the logo is **dark art on a dark band** (uses screen blend so it shows). `false` for white/light logos. |
| `logoW` | Logo size in px. ~60 when paired with a wordmark, ~230 when it's the only thing. |
| `wordmark` | Typed brand name. Leave `""` if the logo image already contains the name. |
| `photoPos` | Nudges the face in the circle — `"x% y%"`. Lower y = show more of the top. |
| `services` | Array of lines shown in the footer band. |
| `pdf` | Path to a brochure, e.g. `"files/brochure.pdf"`. `""` hides the button. |
| `ga` | Optional GA4 ID for that card only. `""` = no tracking. |

**Save Contact needs no file** — the .vcf is generated automatically from the fields.

## Quick colour ideas

| Look | brand | gold |
|---|---|---|
| Navy / gold (premium) | `#0D1B2A` | `#C9A84C` |
| Forest green | `#1B4D3E` | `#C9A84C` |
| Maroon | `#4F1219` | `#C9A15D` |
| Charcoal | `#1C1C1E` | `#D4AF37` |
| Deep teal | `#0E3B43` | `#E0B973` |

## Test locally
```
python -m http.server 8000
```
then open `http://localhost:8000/?c=sample`

(Locally use `?c=slug`. On Vercel the clean `/slug` URL works.)

## Photos
Square-ish crops work best. Keep them under ~500KB so cards load fast on mobile data.
