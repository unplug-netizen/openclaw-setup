# Agent Routing für Telegram Prefix-Commands

Dieses Dokument definiert das Routing-Verhalten für Prefix-Commands in Telegram.

## Verfügbare Commands

- `/coder <aufgabe>` → Leitet an den `coder` Agent weiter
- `/research <frage>` → Leitet an den `research` Agent weiter
- Kein Prefix → `main` Agent (Creo) antwortet direkt

## Implementierung

Wenn eine Nachricht mit `/coder` oder `/research` beginnt:
1. Extrahiere den Command und den Rest der Nachricht
2. Starte einen Sub-Agent mit dem entsprechenden Agent-ID
3. Leite die Nachricht (ohne Prefix) an den Sub-Agent weiter

## Agents

### main (Creo)
- **Rolle:** Allgemeine Aufgaben, direkte Kommunikation, Projektmanagement
- **Skills:** self-improving-agent, project-runner, git-operations, ddg-web-search, browser-automation

### coder
- **Rolle:** Code-Assistent für Programmieraufgaben, DevOps, Deployment
- **Workspace:** `/data/.openclaw/workspace/coder`
- **Skills:** docker, vercel, firebase, github, code-quality, testing, browser-automation, git-operations, ddg-web-search

### research
- **Rolle:** Recherche-Agent mit Browser, TTS, Reasoning
- **Workspace:** `/data/.openclaw/workspace-research`
- **Model:** kimi-coding/k2p5
- **Skills:** ddg-web-search, context-driven-development, browser-automation, git-operations
