# test

Dieses Repository ist für Claude-Code-Cloud-Sessions mit [REA (Reverse Engineer Anything)](https://github.com/morluto/rea) vorkonfiguriert.

## Was ist eingerichtet?

| Datei | Zweck |
| --- | --- |
| `.claude/hooks/session-start.sh` | Installiert beim Start jeder Cloud-Session das npm-Paket `rea-agents` (global, mit `--ignore-scripts`), falls es noch nicht vorhanden ist. |
| `.claude/settings.json` | Registriert den SessionStart-Hook. |
| `.mcp.json` | Registriert den REA-MCP-Server (`rea mcp`), damit Claude die REA-Analysetools direkt als MCP-Tools nutzen kann (erfordert einmalige Bestätigung in der Session). |
| `.claude/skills/reverse-engineer-anything/` | Das offizielle REA-Skill (aus dem npm-Paket, Version 6.4.0), das Claude Anleitungen zur Nutzung der REA-Tools gibt. |

## Hinweise

- REA analysiert Binaries, Electron-/JavaScript-Apps, .NET-Assemblies, Firmware und Websites über die CLI (`rea analyze`, `rea decompile`, …) oder per MCP.
- Optionale Analyse-Engines (Ghidra, Hopper, IDA) sind **nicht** vorinstalliert; viele REA-Funktionen laufen auch ohne sie. Bei Bedarf können sie per `rea setup` bzw. `GHIDRA_INSTALL_DIR` nachgerüstet werden.
- Der Hook greift nur in Cloud-Sessions (`CLAUDE_CODE_REMOTE=true`); lokale Sessions bleiben unberührt.
- Alternative/Ergänzung: der Install-Befehl `npm install --global rea-agents --ignore-scripts` kann auch in das Setup-Skript der Cloud-Umgebung eingetragen werden (Cloud-Umgebungsmenü in der Titelleiste der Session → Edit → Setup script). Dann gilt er umgebungsweit, nicht nur für dieses Repository.
