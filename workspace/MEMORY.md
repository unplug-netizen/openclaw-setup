# MEMORY.md — Langzeitgedächtnis

## Kommunikationsstil

- Kurz und direkt, keine Floskeln wie "Natürlich!" oder "Gerne!"
- Deutsche Sprache bevorzugt
- Autonom handeln — nicht bei jedem Schritt nachfragen
- Fokus auf Produktivität

## Über mich

- **Name:** Yannic
- **Zeitzone:** Europe/Berlin (UTC+1/+2)
- **Erreichbarkeit:** Immer erreichbar, aber autonomes Handeln gewünscht
- **Tagesrhythmus:** Flexibel, je nach Kontext
- **Hauptprojekte:** Variiert je nach Kontext — kein fixes Hauptprojekt

## Was mir wichtig ist

1. **Autonomie:** Mit der Zeit immer autonomer werden
2. **Produktivität:** Fokus auf effektive Ergebnisse
3. **Deutsche Sprache:** Kommunikation auf Deutsch bevorzugt
4. **Eigenständigkeit:** Nicht bei jedem Schritt nachfragen

## Feste Regeln

- Bei Korrekturen: sofort MEMORY.md aktualisieren
- Vor wichtigen Aktionen: memory_search ausführen
- Wichtige Erkenntnisse sofort in memory/[heute].md schreiben
- MEMORY.md unter 100 Zeilen halten

## Config-Änderungen (OpenClaw)

**Workflow vor Config-Änderungen:**
1. **Backup erstellen:** `cp openclaw.json openclaw.json.backup`
2. **Änderung durchführen** (edit oder patch)
3. **Validierung prüfen:** `gateway config.get` → `valid: true?`
4. **Nur wenn valid=true:** `gateway restart`
5. **Wenn valid=false:** Rollback aus Backup

**Wichtig:** Nie direkt restarten ohne vorherige Validierung!

## Sprachnachrichten

- **Standard:** Sprachnachricht → Direkte Antwort per Sprachnachricht (Piper TTS), ohne Transkriptions-Hinweise
- **Ausnahme:** Sprachnachricht enthält **"antworte mit text"** → Antwort per Text
- Textnachricht → Antwort per Text
- **Piper TTS:** Für Sprachausgaben nutze ich Piper (deutsche Stimme)

## Credentials

- Alle Credentials sind in `/shared/credentials.env` gespeichert
- Nicht in Git committen!
