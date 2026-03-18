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

- **main** (Creo): Allgemeine Aufgaben, direkte Kommunikation
- **coder**: Code-Assistent für Programmieraufgaben
- **research**: Recherche-Agent mit Browser, TTS, etc.
