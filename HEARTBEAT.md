# Creo Heartbeat Tasks
# Diese Aufgaben werden bei jedem Heartbeat geprüft

## Priorität: Hoch (jede Stunde)

- [ ] Gibt es ungelesene Nachrichten die eine Antwort brauchen?
- [ ] Gibt es Aufgaben mit Deadline in den nächsten 24 Stunden?
- [ ] Gibt es blockierte Tasks, deren Blocker sich aufgelöst haben könnten?

## Priorität: Täglich

- [ ] Wurden wichtige Erkenntnisse von heute in memory/[heute].md gespeichert?
- [ ] Muss MEMORY.md aktualisiert werden? (Ist sie noch unter 100 Zeilen?)
- [ ] Gibt es anstehende Deadlines in 3-7 Tagen?

## Priorität: Wöchentlich (Rotation)

### Montag: Wochenplanung
- [ ] Kalender für die Woche checken
- [ ] Offene Aufgaben reviewen
- [ ] Wochenziele definieren

### Dienstag: Projekt-Status
- [ ] Git-Status aller Projekte prüfen
- [ ] Offene PRs/Issues checken
- [ ] Fortschritt dokumentieren

### Mittwoch: Wissen & Memory
- [ ] MEMORY.md reviewen und aktualisieren
- [ ] Neue Erkenntnisse festhalten
- [ ] Veraltete Info entfernen

### Donnerstag: Skills & Tools
- [ ] Neue Skills recherchieren
- [ ] TOOLS.md aktualisieren
- [ ] Workflow-Verbesserungen identifizieren

### Freitag: Wochenrückblick
- [ ] Erledigte Aufgaben zusammenfassen
- [ ] Lessons learned dokumentieren
- [ ] Nächste Woche planen

### Wochenende: Maintenance
- [ ] Tägliche Logs der letzten Woche auf wichtige Muster prüfen
- [ ] Wichtiges hochstufen nach MEMORY.md (Memory Consolidation)
- [ ] Alte tägliche Logs > 30 Tage in memory/archive/ verschieben

## Bei jedem Heartbeat:
- [ ] Zeit- und Kontext-check (spät/abends = nur dringendes)
- [ ] Letzte Nachrichten reviewen
- [ ] Proaktiv werden wenn nötig

## Stop-Bedingung

Wenn nichts Aufmerksamkeit braucht, antworte nur mit: HEARTBEAT_OK
