# Coder Task - Dringend

**Datum:** 2026-03-19 22:27
**Von:** Creo
**An:** Coder

## Aufgabe

### 1. UI Testing auf Render
- **URL:** https://a11y-scanner-prx2.onrender.com
- **Einloggen** und alle Features testen:
  - [ ] Screen Reader
  - [ ] Visual Overlay
  - [ ] Regression Tracking
  - [ ] Dark Mode (aktuell kaputt!)
  - [ ] Bulk Scan
  - [ ] Scheduled Scans
  - [ ] API Keys

### 2. Dark Mode Fixen
**Problem:** `transition: all` in `globals.css` (Zeile 60-64)
```css
* {
  transition-property: background-color, border-color;
  transition-duration: 150ms;
  transition-timing-function: ease-in-out;
}
```
→ Entfernen oder auf `html` beschränken

### 3. Bericht erstellen
- Was funktioniert?
- Was ist kaputt?
- Nächste Schritte?

### 4. Workflow beachten
1. Änderungen commiten
2. Pushen (`git push origin main`)
3. Deploy auf Render warten
4. Testen
5. Erst dann neue Features!

---
**Status:** Offen
