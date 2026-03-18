# OpenClaw Setup

Dieses Repository enthält die Konfiguration und Dokumentation für das OpenClaw-Setup von Yannic (@yb1991).

## Übersicht

- **Host**: Hostinger VPS (Docker)
- **Workspace**: `/data/.openclaw/workspace`
- **Zeitzone**: Europe/Berlin
- **OpenClaw Version**: 2026.3.12

## Struktur

```
/data/.openclaw/
├── openclaw.json          # Hauptkonfiguration
├── workspace/             # Arbeitsbereich
│   ├── AGENTS.md          # Agent-Definitionen
│   ├── SOUL.md            # Persönlichkeit/Verhalten
│   ├── TOOLS.md           # Tool-Konfiguration
│   ├── MEMORY.md          # Langzeitgedächtnis
│   ├── HEARTBEAT.md       # Heartbeat-Tasks
│   └── memory/            # Tägliche Memory-Logs
├── agents/                # Agent-spezifische Daten
├── cron/                  # Cron-Jobs
├── shared-skills/         # Gemeinsame Skills
└── logs/                  # Log-Dateien
```

## Agents

| Agent | ID | Zweck | Workspace |
|-------|-----|-------|-----------|
| Creo (main) | main | Haupt-Agent, allgemeine Aufgaben | `/data/.openclaw/workspace` |
| Coder | coder | Code-Assistent | `/data/.openclaw/workspace/coder` |
| Research | research | Recherche-Agent | `/data/.openclaw/workspace-research` |

## Channels

- **Telegram**: Aktiviert (Primary Channel)
  - Bot: @yb1991
  - Chat ID: 615670836

## Cron-Jobs

| Job | Zeit | Beschreibung |
|-----|------|--------------|
| Nightly memory consolidation | 03:00 täglich | Memory-Konsolidierung |
| Morgenbriefing | 07:00 täglich | Tägliches Briefing |
| Weekly memory cleanup | 22:00 sonntags | Wöchentliche Bereinigung |
| Git backup | 02:00 täglich | Git-Backup |
| OpenClaw Monitor | 09:00 täglich | Setup-Monitoring |

## Models

- **Primary**: moonshot/kimi-for-coding
- **Secondary**: kimi-coding/k2p5

## Skills

- self-improving-agent
- local-whisper (shared)
- piper-tts (shared)

## Backup-Hinweis

Dieses Repository wird täglich automatisch aktualisiert. Manuelle Änderungen sollten über Feature-Branches erfolgen.
