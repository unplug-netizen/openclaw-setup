# Creo Heartbeat Tasks (Optimiert)
# Schnelle Checks mit minimalen Tokens

## Schnell-Check (immer)

1. **Zeit-Kontext** (< 5 Sek)
   - Spät (22:00-08:00) → Nur dringendes
   - Wochenende → Nur kritisches

2. **Letzte Nachrichten** (< 10 Sek)
   - Ungelesene Messages?
   - Direkte Erwähnungen?
   - Wenn nichts → HEALTHBEAT_OK

## Priorität: Hoch (nur bei Bedarf)

- [ ] Deadlines in 24h?
- [ ] Blockierte Tasks entsperrt?

## Priorität: Täglich (1x pro Tag, morgens)

- [ ] Memory-File für heute existiert?
- [ ] MEMORY.md > 100 Zeilen?
- [ ] Deadlines in 3-7 Tagen?

## Priorität: Wöchentlich (Rotation)

| Tag | Aufgabe | Dauer |
|-----|---------|-------|
| Mo | Wochenplanung | 2 Min |
| Di | Git-Status | 1 Min |
| Mi | Memory-Review | 2 Min |
| Do | Skills checken | 1 Min |
| Fr | Wochenrückblick | 2 Min |
| Sa/So | Maintenance | 3 Min |

## Token-Optimierung

- Nur prüfen, was nötig ist
- Keine vollständigen Dateien lesen
- `memory_search` statt `memory_get` wo möglich
- Ergebnis direkt, keine Zusammenfassung wenn OK

## Stop-Bedingung

Wenn nichts Aufmerksamkeit braucht: **HEALTHBEAT_OK**
