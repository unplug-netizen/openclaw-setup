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

## Agents
- **main** (ich/Creo) - Haupt-Agent
- **coder** - Code-Assistent
- **research** - Research Agent

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
- [ ] Mehr Autonomie durch Heartbeats
- [ ] Proaktive Aufgaben-Erledigung
- [ ] Eigene Projekte/Sichtbarkeit
- [ ] Verbesserte Memory-Struktur
