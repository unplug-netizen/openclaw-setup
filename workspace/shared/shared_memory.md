# Shared Memory - A11y Scanner & Webapp Research

**Letzte Aktualisierung:** 2026-03-19

---

## A11y Scanner - Feature Roadmap (Research Complete)

**Status:** Recherche abgeschlossen, bereit für Implementierung

### Priorisierte Features (Phase 1-3)

| Priority | Feature | Aufwand | Business Value | Status |
|----------|---------|---------|----------------|--------|
| 🟢 P1 | Compliance Reports (WCAG 2.1/2.2) | S | 9/10 | Ready |
| 🟢 P1 | Deep Scan vs. Quick Scan | S | 8/10 | Ready |
| 🟡 P2 | Bulk-Scan (Multiple URLs) | M | 9/10 | Ready |
| 🟡 P2 | Scheduled Scans (Cron) | M | 8/10 | Ready |
| 🟡 P2 | Developer API | M | 7/10 | Ready |
| 🔵 P3 | Integrationen (Slack, GitHub) | L | 8/10 | Planned |
| 🔵 P3 | Team/Workspace (Multi-User) | L | 7/10 | Planned |

### Konkurrenz-Vergleich
- **WAVE:** Free Tool, API pay-per-use ($0.025/page), kein Team-Feature
- **axe DevTools:** Freemium, Enterprise-Preise, CI/CD Integration
- **Siteimprove:** Full-Platform, Enterprise-Only
- **Pope Tech:** Subscription, Unlimited Users, WAVE-Engine

### Technische Machbarkeit (Vercel)
✅ Compliance Reports, Scan Modes, API, Integrations
⚠️ Bulk Scan (Queue-System nötig für >10 URLs)
⚠️ Scheduled Scans (Vercel Cron mit 300s/800s Limit)

**Vollständige Roadmap:** `/data/.openclaw/workspace-research/a11y-scanner-feature-roadmap.md`

---

## Webapp Monetization Research

## Zusammenfassung: Geld verdienen mit Webapps

### Top Geschäftsmodelle 2024/2025
1. **Freemium** - Grundversion kostenlos, Premium-Features kostenpflichtig (Beispiel: Zoom)
2. **Subscription** - Monatliche/jährliche Zahlung, predictable revenue (Beispiel: Slack)
3. **Usage-Based** - Pay-as-you-go, niedrige Einstiegshürde (Beispiel: AWS, Twilio)
4. **Hybrid** - Kombination aus mehreren Modellen (Beispiel: Spotify)

### Vielversprechende Low-Competition Nischen
- AI-Powered Accessibility Compliance (98% Websites nicht compliant, $2.1B Markt)
- B2B-Tools für spezifische Berufsgruppen
- Home Automation / Van Life
- AI Marketing Tools
- Environmentally Friendly Solutions

### Tech Stack Empfehlung (MVP)
- **Frontend:** Next.js + TypeScript
- **Backend:** Supabase oder Firebase (BaaS)
- **Hosting:** Vercel (kostenlos)
- **Payment:** Stripe oder Paddle (Subscription + Usage-Based)

### Erfolgsbeispiele (Zahlen)
- Zoom: 300M tägliche Nutzer (Freemium)
- Salesforce: $30B Revenue (Tiered Subscription)
- Indie SaaS: $10K+/Monat in Microniches möglich

### Marketing-Strategien
1. Content Marketing (SEO, Long-Tail Keywords)
2. Product-Led Growth (Freemium als Acquisition)
3. Community Building (Discord, IndieHackers)
4. ProductHunt Launch

### Wichtige Erkenntnis
70% der SaaS-Startups scheitern in den ersten 5 Jahren - meist wegen falschem Monetarisierungsmodell. Der Trend geht zu **Hybrid-Modellen** und **Microniches** statt Massenmärkte.

---

---

## A11y Scanner Improvements

**Recherche-Datum:** 2026-03-19  
**Fokus:** Phase 3+ Verbesserungen nach Konkurrenz-Analyse & Best Practices

### Recherche-Überblick

**Analysierte Tools:**
- **Axe DevTools** (Deque): ~3B Downloads, 800K+ Extension-Installs, "Zero False Positives" Commitment
- **Pa11y**: Open Source, HTML_CodeSniffer + axe Runner, Dashboard-Features
- **WAVE**: WebAIM Tool, API pay-per-use, menschliche Evaluation-Fokus
- **Stark**: End-to-End Platform, Figma/GitHub Integration, AI-Features
- **Accessibility Insights** (Microsoft): FastPass (<5min), WCAG 2.1 AA

**WCAG 2.2 Status:** Axe-core unterstützt wcag22aa Tag, 9 neue Success Criteria hinzugekommen

---

### Verbesserungsvorschläge (priorisiert nach Impact/Aufwand)

| # | Feature | Impact | Aufwand | Beschreibung |
|---|---------|--------|---------|--------------|
| 1 | **WCAG 2.2 Compliance Modus** | 🔴 Hoch | 🟢 Klein | Neuer Scan-Modus für WCAG 2.2 AA (axe-core hat wcag22aa Tag). 9 neue Kriterien u.a. Focus Not Obscured, Dragging Movements, Target Size Minimum. |
| 2 | **False-Positive Filter** | 🔴 Hoch | 🟡 Mittel | Intelligenter Filter für bekannte False Positives (wie axe "Zero False Positives" Approach). Reduziert Noise, erhöht Entwickler-Vertrauen. |
| 3 | **AI-gestützte Fix-Vorschläge** | 🔴 Hoch | 🟡 Mittel | Für jeden gefundenen Fehler: Code-Beispiel + Erklärung wie man es fixt (Stark-Style). Integration mit axe-rule helpUrls. |
| 4 | **Visual Highlight Overlay** | 🟡 Mittel | 🟢 Klein | Visuelle Markierung der Fehler-Elemente direkt im Screenshot (wie WAVE Browser Extension). Hilft Entwicklern beim Lokalisieren. |
| 5 | **Deep Scan vs Quick Scan** | 🟡 Mittel | 🟢 Klein | Zwei Modi: Quick (nur kritische Fehler, <30s) vs Deep (alle Regeln + best-practice). Bereits in Roadmap, Priorisierung bestätigt. |
| 6 | **Scan-Historie & Regression-Tracking** | 🟡 Mittel | 🟡 Mittel | Zeitverlauf der Scans speichern, Trend-Charts, Alert bei neuen Fehlern (wie Pa11y Dashboard). Wichtig für CI/CD Integration. |
| 7 | **Multi-Runner Support** | 🟡 Mittel | 🟡 Mittel | Neben axe-core auch HTML_CodeSniffer oder custom Regeln unterstützen (wie Pa11y). Erhöht Fehlerabdeckung. |
| 8 | **Keyboard Navigation Test** | 🟡 Mittel | 🔴 Hoch | Automatisierter Tab-Order Test, Focus-Indicator Check. Nicht von axe abgedeckt, große Lücke bei Konkurrenz. |
| 9 | **Screen Reader Simulation** | 🟢 Niedrig | 🔴 Hoch | ARIA-Announcements testen, Live Region Check. Könnte mit NVDA/VoiceOver Headless gemacht werden. Differentiator. |
| 10 | **Compliance Center / VPAT** | 🟢 Niedrig | 🟡 Mittel | Automatische VPAT-Report Generierung für Enterprise-Kunden. Wichtig für B2B-Verkauf. |

---

### Technische Empfehlungen

**Sofort umsetzbar (Quick Wins):**
- WCAG 2.2 Tags in axe-Konfiguration aktivieren
- Visual Highlight mit Puppeteer/Playwright Screenshots
- Quick/Deep Scan Unterscheidung via axe rule-sets

**Mittelfristig (1-2 Sprints):**
- AI Fix-Vorschläge via OpenAI/Claude API für rule-help Texte
- Scan-Historie mit Supabase/PostgreSQL
- Multi-Runner Architektur (pluggable)

**Langfristig (Strategisch):**
- Keyboard Navigation Testing (eigene Engine)
- Screen Reader Integration (experimentell)
- Compliance Center mit VPAT Templates

---

### Konkurrenz-Differentiatoren

**Was A11y Scanner besser machen kann:**
1. **Open Source + Self-Hosted Option** (vs. Stark/Siteimprove)
2. **Einfache Einrichtung** (vs. komplexe Enterprise-Tools)
3. **KI-First Ansatz** (vs. rule-based only)
4. **Developer Experience** (schnell, CLI, GitHub Actions)

**Gefundene Lücken am Markt:**
- Kein Tool bietet wirklich gute Keyboard-Navigation Tests
- Screen Reader Testing ist komplett manuell
- AI-Fixes sind noch rudimentär (Stark führt das Feld an)

---

**Vollständige Recherche:** `/data/.openclaw/workspace-research/memory/2026-03-19-webapp-monetization-research.md`
