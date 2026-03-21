# Infrastruktur & Tech-Stack (Shared)

**Projekt:** A11y Scanner  
**Letzte Aktualisierung:** 2026-03-20

---

## Entwicklungsumgebung

| Komponente | Details |
|------------|---------|
| **Host** | Hostinger VPS (Docker) |
| **Node.js** | 20.x |
| **Package Manager** | npm |
| **Workspace** | `/data/.openclaw/workspace/coder/projects/a11y-scanner` |

---

## Frontend Stack

```
Next.js 16.2.0
├── React 19.2.4
├── TypeScript 5
├── Tailwind CSS 4
└── Lucide React (Icons)
```

---

## Backend & APIs

| Service | Zweck | Status |
|---------|-------|--------|
| **Supabase** | Auth + PostgreSQL Database | ✅ Aktiv |
| **Upstash Redis** | Rate Limiting | ✅ Aktiv |
| **OpenAI API** | KI-gestützte Fix-Vorschläge | ✅ Aktiv |
| **Sentry** | Error Tracking | ✅ Aktiv |

---

## Testing & QA

| Tool | Verwendung |
|------|-----------|
| **Jest** | Unit Tests |
| **Playwright** | E2E Tests |
| **@axe-core/react** | Accessibility Tests |
| **Testing Library** | React Component Tests |

---

## Deployment Pipeline

```
GitHub Push
    ↓
Render (Auto-Deploy)
    ↓
https://a11y-scanner-prx2.onrender.com
```

**Backup/Preview:** Vercel

---

## Umgebungsvariablen (Wichtige)

```bash
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# OpenAI
OPENAI_API_KEY=

# Redis (Upstash)
REDIS_URL=

# Sentry
NEXT_PUBLIC_SENTRY_DSN=
```

*Vollständige Liste: Siehe `.env.example` im Coder-Workspace*

---

## Monitoring & Logs

| Service | URL | Zweck |
|---------|-----|-------|
| **Render Dashboard** | dashboard.render.com | Deploy-Status |
| **Sentry** | sentry.io | Error Tracking |
| **Supabase** | supabase.com | Database/Auth |

---

## Skalierung & Limits

| Ressource | Limit | Status |
|-----------|-------|--------|
| Render (Free) | 512 MB RAM, 0.1 CPU | ⚠️ Begrenzt |
| Supabase (Free) | 500 MB DB | ✅ OK |
| OpenAI API | Rate Limits | ✅ OK |
| Upstash Redis | 10k cmds/day | ✅ OK |

---

## Sicherheit

- ✅ Environment-Variablen nicht im Git
- ✅ Supabase Row Level Security (RLS)
- ✅ Rate Limiting via Redis
- ✅ Sentry für Error-Monitoring

---

*Für technische Details siehe Coder-Workspace: `/data/.openclaw/workspace/coder/projects/a11y-scanner/`*
