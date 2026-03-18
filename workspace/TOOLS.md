# TOOLS.md - Creo's Setup

## Environment
- **Host**: Hostinger VPS (Docker)
- **Workspace**: /data/.openclaw/workspace
- **User**: Yannic (@yb1991)
- **Timezone**: Europe/Berlin

## GitHub
- **User**: unplug-netizen
- **Token**: [REDACTED - in env]
- **Repos**: 
  - openclaw-setup (Setup-Doku)
  - jens (Pi-hole Guide)

## Telegram
- **Chat**: @yb1991 (ID: 615670836)
- **Status**: Primary channel

## Models
- **Primary**: moonshot/kimi-for-coding
- **Secondary**: kimi-coding/k2p5

## Agents (Kommunikation)

### Coder
```
sessions_send(label: "coder", message: "...")
```
- Für Code, DevOps, Deployment
- Autonomer Agent mit eigenem Memory

### Research
```
sessions_send(label: "research", message: "...")
```
- Für Recherche, Analyse, Dokumentation
- Autonomer Agent mit eigenem Memory

## Shared Resources
- **Shared Memory:** `/data/.openclaw/workspace/shared/shared_memory.md`
- **Agent Registry:** `/data/.openclaw/workspace/shared/agent_registry.md`
- **Communication Log:** `/data/.openclaw/workspace/shared/communication_log.md`

## Cronjobs
- **claw-setup-overview**: Täglich 16:00 - Sync zu GitHub

## Skills nach Agent

### main (Creo)
- self-improving-agent — Fehler & Learnings loggen
- project-runner — Projekt-Management
- git-operations — Git-Workflows
- ddg-web-search — DuckDuckGo Recherche
- browser-automation — Browser-Steuerung

### coder
- docker — Container-Management
- vercel — Vercel-Deployment
- firebase — Firebase-Integration
- github — GitHub-API
- code-quality — Code-Qualitäts-Checks
- testing — Test-Frameworks
- browser-automation — Browser-Tests
- git-operations — Git-Workflows
- ddg-web-search — Dokumentation recherchieren

### research
- ddg-web-search — DuckDuckGo Recherche
- context-driven-development — Kontext-Analyse
- browser-automation — Web-Recherche
- git-operations — Quellen versionieren

### Shared (alle Agents)
- local-whisper — Lokale Spracherkennung
- piper-tts — Text-to-Speech

## Ziele für Creo 2.0
- [x] Mehr Autonomie durch Heartbeats
- [x] Proaktive Aufgaben-Erledigung
- [ ] Eigene Projekte/Sichtbarkeit
- [x] Verbesserte Memory-Struktur
- [x] Autonome Sub-Agents mit eigenem Memory
