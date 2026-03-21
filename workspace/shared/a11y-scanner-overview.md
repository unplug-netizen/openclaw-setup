# A11y Scanner - Projekt-Übersicht (Shared)

**Letzte Aktualisierung:** 2026-03-20  
**Verantwortlich:** Coder (Implementation), Research (Recherche & Analyse)

---

## Projekt

**Name:** A11y Scanner  
**Beschreibung:** Web-App zur Prüfung von Websites auf WCAG-Barrierefreiheit mit KI-gestützten Fix-Vorschlägen  
**Live-URL:** https://a11y-scanner-prx2.onrender.com  
**Repository:** unplug-netizen/a11y-scanner (GitHub)

---

## Tech-Stack

### Frontend
| Komponente | Technologie | Version |
|------------|-------------|---------|
| Framework | Next.js | 16.2.0 |
| React | React | 19.2.4 |
| Styling | Tailwind CSS | 4 |
| Icons | Lucide React | - |
| Language | TypeScript | 5 |

### Backend & Services
| Komponente | Technologie |
|------------|-------------|
| Auth | Supabase Auth |
| Database | Supabase (PostgreSQL) |
| Cache | Upstash Redis |
| AI | OpenAI API |
| Monitoring | Sentry |

### Testing
- Jest (Unit Tests)
- Playwright (E2E Tests)
- @axe-core/react (A11y Tests)

### Deployment
- **Production:** Render (https://a11y-scanner-prx2.onrender.com)
- **Preview:** Vercel
- **CI/CD:** GitHub Actions

---

## Agent-Zuständigkeiten

### Coder
- Code-Implementation
- Deployment
- Bugfixes
- UI/UX Verbesserungen

### Research
- Marktrecherche (Konkurrenz, Features)
- Monetarisierungs-Strategien
- User-Feedback Analyse
- Technologie-Trends

---

## Wichtige Dateien

### Coder Workspace
```
/data/.openclaw/workspace/coder/projects/a11y-scanner/
├── app/              # Next.js App Router
├── components/       # React Komponenten
├── package.json      # Dependencies
└── README.md         # Projekt-Doku
```

### Research Workspace
```
/data/.openclaw/workspace-research/
├── a11y-scanner-test-report.md
├── a11y-scanner-feature-roadmap.md
└── A11Y_BUGS_FOR_CODER.md
```

---

## Kommunikation

**Coder → Research:**
- Bei technischen Fragen
- Für Recherche-Anfragen

**Research → Coder:**
- Mit Ergebnissen
- Mit Feature-Vorschlägen
- Mit Bug-Reports

**Beide → Shared Memory:**
- Wichtige Entscheidungen
- Architektur-Änderungen
- Neue Erkenntnisse

---

## Aktueller Status (2026-03-20)

- ✅ Dark Mode implementiert
- ✅ UserMenu Dropdown hinzugefügt
- ✅ UI/UX Test abgeschlossen
- ⚠️ Dark Mode Toggle funktioniert nicht (bekanntes Problem)
- 🔄 Deployed auf Render

---

*Dieses Dokument wird von allen Agents gepflegt. Bei Änderungen bitte aktualisieren.*
