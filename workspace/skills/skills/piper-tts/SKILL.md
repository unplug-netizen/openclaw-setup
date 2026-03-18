# Piper TTS Skill

Schnelles, lokales Text-to-Speech System mit deutschen Stimmen.

## Überblick

Piper ist ein neuronales Text-to-Speech System, das lokal auf der CPU läuft. Es ist schnell, datenschutzfreundlich und benötigt keine Cloud-Verbindung.

## Installation

Das Skill ist bereits vollständig installiert mit:
- Piper Binary (Linux x86_64)
- Deutsche Stimme (Thorsten Low)
- Wrapper-Skript für einfache Nutzung

## Verwendung

### Grundlegende Nutzung

```bash
# Text zu WAV-Datei
piper-tts "Hallo Welt" --output output.wav

# Hilfe anzeigen
piper-tts --help
```

### Optionen

| Option | Beschreibung | Standard |
|--------|--------------|----------|
| `--output FILE` | Ausgabedatei (WAV) | stdout |
| `--voice FILE` | Andere Stimme verwenden | thorsten-low |
| `--speaker NUM` | Sprecher-ID (Multi-Speaker) | 0 |
| `--speed NUM` | Sprechgeschwindigkeit (0.5-2.0) | 1.0 |

### Beispiele

```bash
# Einfache Ausgabe
piper-tts "Guten Morgen!" --output morgen.wav

# Andere Geschwindigkeit
piper-tts "Das ist ein Test." --output test.wav --speed 1.2

# Direkte Wiedergabe (mit sox)
piper-tts "Hallo!" | sox - -d

# Langer Text
piper-tts "Das ist ein viel längerer Text, der vorgelesen werden soll." --output lang.wav
```

## Verfügbare Stimmen

Aktuell installiert:
- **thorsten-low** (de_DE) - Männliche Stimme, gute Qualität

Weitere Stimmen können von [Hugging Face](https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0) heruntergeladen werden:
- karlsson-low (de_DE)
- eva_k-x-low (de_DE)
- ramona-low (de_DE)

## Dateien

```
piper-tts/
├── piper/              # Piper Binary und Bibliotheken
│   ├── piper           # Hauptbinary
│   └── ...
├── voices/             # Stimmenmodelle
│   ├── thorsten-low.onnx
│   └── thorsten-low.onnx.json
├── piper-tts           # Wrapper-Skript
└── SKILL.md            # Diese Datei
```

## Abhängigkeiten

- Linux x86_64
- sox (für Audio-Wiedergabe)

## Ressourcen

- [Piper GitHub](https://github.com/rhasspy/piper)
- [Piper Voices](https://huggingface.co/rhasspy/piper-voices)
- [Piper Releases](https://github.com/rhasspy/piper/releases)
