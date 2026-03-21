# TOOLS.md - Coder's Setup

## Environment
- **Host:** Hostinger VPS (Docker)
- **Workspace:** /data/.openclaw/workspace/coder
- **User:** Yannic (@yb1991)
- **Timezone:** Europe/Berlin

## GitHub
- **User:** unplug-netizen
- **Token:** [REDACTED - in env]

## Models
- **Primary:** moonshot/kimi-for-coding

## Agents (Kommunikation)

### Creo (main) — Orchestrator
```
sessions_send(label: "main", message: "...")
```
- Für strategische Fragen
- Bei Unsicherheiten
- Für Koordination

### Research
```
sessions_send(label: "research", message: "...")
```
- Für Dokumentation
- Für API-Research
- Für Zusammenfassungen

## Skills
- docker — Container-Management
- vercel — Vercel-Deployment
- firebase — Firebase-Integration
- github — GitHub-API
- code-quality — Code-Qualitäts-Checks
- testing — Test-Frameworks
- browser-automation — Browser-Tests
- git-operations — Git-Workflows
- ddg-web-search — DuckDuckGo Recherche
- self-improving-agent — Fehler & Learnings loggen

## Shared Resources
- **Shared Memory:** `/data/.openclaw/workspace/shared/`
- **Agent Registry:** `/data/.openclaw/workspace/shared/agent_registry.md`
