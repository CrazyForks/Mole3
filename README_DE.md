<h4 align="right"><a href="README.md">English</a> | <a href="README_CN.md">中文</a> | <a href="README_TW.md">繁體</a> | <strong>Deutsch</strong> | <a href="README_FR.md">Français</a> | <a href="README_KR.md">한국어</a></h4>

<div align="center">
  <h1>Mole</h1>
  <p><em>🐹 Tiefenreinigung, App-Deinstallation, Systemoptimierung, Festplattenanalyse und Statusüberwachung für Mac — schnelles Open-Source-CLI, plus native App</em></p>
</div>

<p align="center">
  <a href="https://github.com/tw93/mole/stargazers"><img src="https://img.shields.io/github/stars/tw93/mole?style=flat-square" alt="Stars"></a>
  <a href="https://github.com/tw93/mole/releases"><img src="https://img.shields.io/github/v/tag/tw93/mole?label=version&style=flat-square" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL_v3-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://github.com/tw93/mole/commits"><img src="https://img.shields.io/github/commit-activity/m/tw93/mole?style=flat-square" alt="Commits"></a>
  <a href="https://twitter.com/HiTw93"><img src="https://img.shields.io/badge/follow-Tw93-red?style=flat-square&logo=Twitter" alt="Twitter"></a>
  <a href="https://t.me/+9f9gf4ZrFSQ2OWVl"><img src="https://img.shields.io/badge/chat-Telegram-blueviolet?style=flat-square&logo=Telegram" alt="Telegram"></a>
</p>

<p align="center">
  <img src="./docs/img/big-mole.png" alt="Mole Bereinigungsergebnisse" width="1000" />
</p>

> 💡 Bevorzugst du eine native App? Entdecke [Mole for Mac](https://mole.fit/): sichere Bestätigung vor dem Löschen, Tiefenreinigung von Systemdaten, Bereinigung von KI-Werkzeugen, geprüfte Restdateien-Entfernung für über 800 Apps, Systemoptimierung mit einem Klick und mehrdimensionale Festplattenanalyse. Enthält außerdem Systemüberwachung, Lüftersteuerung und Wachhalte-Funktionen.

## Funktionen

- **All-in-One CLI-Toolkit**: Vereint Workflows wie CleanMyMac, AppCleaner, DaisyDisk und iStat Menus in einem schnellen Terminal-Werkzeug
- **Tiefenreinigung**: Entfernt Caches, Protokolle, Reste und verwaiste Daten, um Speicherplatz freizugeben
- **Smarte App-Deinstallation**: Entfernt Apps mitsamt LaunchAgents, Einstellungen und Restdateien
- **Festplattenanalyse**: Visualisiert den Speicherplatz mit einer interaktiven TUI, findet große Dateien und navigiert Verzeichnisse
- **Systemoptimierung**: Leert DNS-Caches, aktualisiert QuickLook/Icons und optimiert Systemdatenbanken
- **Live-Monitoring**: Zeigt CPU, Arbeitsspeicher, Festplatten-I/O, Netzwerk und Prozesse in Echtzeit

## Schnellstart

Mole erfordert macOS 12 oder neuer und unterstützt sowohl Intel als auch Apple Silicon Macs.

**Installation über Homebrew**

```bash
brew install mole
```

Falls Homebrew deine macOS-Version nicht mehr unterstützt, nutze stattdessen das folgende Skript.

**Oder per Skript**

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash
```

Mole wurde für macOS entwickelt. Eine experimentelle Windows-Version befindet sich im [windows Branch](https://github.com/tw93/Mole/tree/windows).

**Befehle**

```bash
mo                           # Interaktives Menü
mo clean                     # Tiefenreinigung + Reste deinstallierter Apps
mo uninstall                 # Installierte Apps + deren Reste entfernen
mo optimize                  # Caches & Systemdienste aktualisieren
mo analyze                   # Visuelle Festplattenanalyse (oder 'mo analyse')
mo status                    # Live-Dashboard zur Systemgesundheit
mo purge                     # Build-Artefakte von Projekten bereinigen
mo installer                 # Installationsdateien finden und entfernen

mo touchid                   # Touch ID für sudo konfigurieren
mo completion                # Shell-Autovervollständigung einrichten
mo update                    # Mole aktualisieren
mo update --nightly          # Auf neuesten Hauptentwicklungsstand aktualisieren (nur Skript-Installation)
mo remove                    # Mole vollständig vom System entfernen
mo --help                    # Hilfe anzeigen
mo --version                 # Installierte Version anzeigen
```

**Sichere Vorschau (Dry Run)**

```bash
mo clean --dry-run
mo uninstall --dry-run
mo optimize --dry-run
mo purge --dry-run
mo installer --dry-run
mo history
mo history --json

mo clean --dry-run --debug   # Vorschau + detaillierte Protokolle
mo optimize --whitelist      # Geschützte Optimierungsregeln verwalten
mo clean --whitelist         # Geschützte Cache-Pfade verwalten
mo purge --paths             # Projekt-Suchpfade konfigurieren
mo analyze /Volumes          # Nur externe Laufwerke analysieren
mo analyze /private/tmp      # Temporäre Benutzerverzeichnisse prüfen
```

Mit `mo clean --whitelist` gespeicherte Pfade liegen in `~/.config/mole/whitelist`. Du kannst diese Datei auch direkt bearbeiten (ein Pfad pro Zeile). Eigene Pfade ergänzen die Standardregeln, während der integrierte Systemschutz immer aktiv bleibt.

<details>
<summary><strong>Weitere Installationsoptionen</strong></summary>

Um eine bestimmte Version zu installieren, übergib ein beliebiges Tag von der [Releases-Seite](https://github.com/tw93/mole/releases), mit oder ohne führendes `V`. Um den Entwicklungszweig zu nutzen, übergib `main`:

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- 1.51.0
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- main
```

`main` installiert unveröffentlichten Code direkt aus dem Standard-Branch. `latest` ist ein Alias für `main` und installiert nicht das neueste stabile Release.

Das Skript installiert standardmäßig nach `/usr/local/bin`, was Administratorrechte erfordern kann. Für passwortlose Updates mit `mo update` kannst du in ein Benutzerverzeichnis installieren:

```bash
mkdir -p "$HOME/.local/bin"
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- --prefix "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
```

Füge den `PATH`-Export auch zu deiner `~/.zshrc` oder Profil-Datei hinzu.

**Nix**

Unter macOS können Nix-Nutzer den Flake direkt aus dem `main`-Branch installieren:

```bash
nix profile install github:tw93/mole/main#mole
nix profile upgrade mole
nix profile remove mole
```

Für eine deklarative Konfiguration füge `github:tw93/mole/main` als Flake-Input hinzu und nutze `packages.${system}.mole`. Aktualisierungen und Deinstallationen erfolgen dann direkt über Nix.

</details>

Video-Anleitung bevorzugt? Sieh dir das [Mole-Tutorial](https://www.youtube.com/watch?v=UEe9-w4CcQ0) von PAPAYA 電腦教室 an.

## Sicherheit

Mole legt höchsten Wert auf Datensicherheit: Pfade werden streng validiert, systemkritische und geschützte Verzeichnisse unberührt gelassen und destruktive Schritte vor der Ausführung bestätigt. Wenn die Sicherheit einer Datei nicht garantiert werden kann, wird sie übersprungen.

- `clean`, `uninstall`, `purge`, `installer` und `remove` löschen Dateien. Überprüfe sie zuerst mit `--dry-run` und bei Bedarf mit `--debug`.
- Führe Mole **ohne `sudo`** aus; Administratorrechte werden nur bei Bedarf für Systembereinigungen angefordert.
- `mo analyze` verschiebt ausgewählte Objekte nach Bestätigung in den macOS Papierkorb, wo sie wiederhergestellt werden können.
- Alle Aktionen werden in `~/Library/Logs/mole/operations.log` protokolliert; überprüfe sie mit `mo history` oder deaktiviere das Logging mit `MO_NO_OPLOG=1`.
- Schütze Verzeichnisse mit `mo clean --whitelist` oder Wartungsaufgaben mit `mo optimize --whitelist`.

Weitere Details zu Sicherheitsgrenzen findest du in [SECURITY.md](SECURITY.md) und [SECURITY_AUDIT.md](SECURITY_AUDIT.md).

## Funktionsdetails

Die folgenden Beispiele sind gekürzt. Die genauen Einträge und Größen hängen von deinem Mac ab.

### Bereinigung (Clean)

`mo clean` scannt sichere Caches, Protokolle, temporäre Dateien, Entwickler-Artefakte und Reste entfernter Apps. Nutze `mo clean --dry-run` zur Vorschau und `mo clean --whitelist` zum Schutz spezifischer Pfade.

```text
$ mo clean

Clean Your Mac

⚙ Apple Silicon | Free space: 219.0GB

➤ User essentials
  ✓ User app cache · 18 items, 2.4GB
  ✓ User app logs · 7 items, 12.8MB
  ✓ Trash · emptied, 9 items

➤ App caches
  ✓ App Store cache · 8 items, 248.5MB

➤ Browsers
  ✓ Safari cache · 24 items, 642.1MB
  ✓ Chrome cache · 31 items, 1.2GB

➤ Developer tools
  ✓ npm cache · cleaned
  ◎ pnpm cache · skipped (pnpm busy)

======================================================================
Cleanup complete
Tracked cleanup: 4.5GB | Items cleaned: 97 | Categories: 4
Free space: 223.5GB (+4.5GB)
======================================================================
```

### Deinstallation (Uninstall)

`mo uninstall` entfernt installierte Apps vollständig mitsamt Einstellungen, Caches und Autostart-Dateien. Gemeinsam genutzte Dateien anderer Programme bleiben erhalten. Nutze `mo uninstall --dry-run` zur Vorschau. Falls eine App bereits gelöscht wurde, findet `mo clean` verbliebene Reste.

```text
$ mo uninstall

Select Apps to Remove  1/3 selected

➤ ● Photoshop 2024                4.20GB | 2mo ago
  ○ IntelliJ IDEA                 2.80GB | 3d ago
  ○ Premiere Pro                  3.40GB | 2w ago

Files to be removed:

✓ Photoshop 2024, 12.80GB
  ✓ /Applications/Adobe Photoshop 2024/Adobe Photoshop 2024.app
  ✓ ~/Library/Application Support/Adobe/Adobe Photoshop 2024
  ✓ ~/Library/Preferences/com.adobe.Photoshop.plist

======================================================================
Uninstall complete
Removed 1 app, freed 12.80GB: Photoshop 2024
======================================================================
```

### Optimierung (Optimize)

`mo optimize` führt sichere Wartungsaufgaben für Finder, Netzwerk, Datenbanken und macOS-Dienste aus. Aufgaben, die nicht nötig, aktuell verwendet oder nicht verfügbar sind, werden mit Begründung übersprungen. Nutze `mo optimize --dry-run` zur Vorschau und `mo optimize --whitelist` zum Ausschließen bestimmter Aufgaben.

```text
$ mo optimize

Optimize

⚙ System  18/32 GB RAM | 616/926 GB Disk | Uptime 6d

PERFORMANCE DIAGNOSIS
  ✓ No sustained high-CPU bottleneck detected

➤ DNS & Spotlight Check
  → DNS cache flushed
  → Spotlight index verified

➤ Finder Cache Refresh
  → QuickLook thumbnails refreshed
  → Icon services cache rebuilt

➤ Database Optimization
  ◎ Close these apps before database optimization: Safari

➤ Disk Health
  → Disk verify skipped (set MOLE_ENABLE_DISK_VERIFY=1 to enable)

======================================================================
Optimization Complete
Applied 3 optimizations
14 unchanged | 3 skipped | 1 unavailable
======================================================================
```

Pfadmuster werden unterstützt, um beispielsweise dauerhaft gemountete Images wie `/Volumes/mail` vom Unmount-Vorschlag auszuschließen.

### Speicheranalyse (Analyze)

`mo analyze` öffnet einen interaktiven Festplatten-Explorer im Terminal. Unterstützt Pfeiltasten und Vim-Steuerung, Filterung, Mehrfachauswahl, Finder-Vorschau und sicheres Verschieben in den Papierkorb. Externe Laufwerke werden in der Standardübersicht ausgespart; prüfe sie mit `mo analyze /Volumes`. Verwende `mo analyze /private/tmp`, um temporäre Benutzerdateien zu prüfen, ohne sie automatisch zu löschen.

Ein `+` am Ende einer Größenangabe zeigt einen Teilscan an; `unknown` bedeutet, dass die Größe nicht berechnet werden konnte. Durch Timeouts unterbrochene Ergebnisse überschreiben keinen vollständigen Cache; spätere Scans ergänzen fehlende Daten.

`mo analyze --json /path` enthält `scan_status` (`complete`, `partial` oder `unavailable`) für jeden Eintrag.

```text
$ mo analyze

Analyze Disk  (302.1GB free)
Select a location to explore:

 ▶  1. ████████████████████████  47.9%  |  Home                       75.4GB
     2. ███████████               22.0%  |  User Library               34.6GB
     3. ███████                   14.2%  |  Applications               22.4GB
     4. █████                     10.7%  |  System Library             16.9GB
     5. ███                        5.2%  |  Old Downloads (90d+)       8.2GB  >3mo
```

### Systemstatus (Status)

`mo status` ist ein schreibgeschütztes Dashboard für Hardware, Systemauslastung, Festplattenaktivität, Netzwerkverkehr, Stromversorgung und Prozesse.

Wenn die Standard-IPv4-Route über ein VPN läuft, erfasst die Grafikanzeige diese Schnittstelle, um doppelte Zählungen mit dem physischen Adapter zu vermeiden.

```text
$ mo status

Mole Status  Health ● 92  MacBook Pro · M4 Pro · 32GB · macOS 26

⚙ CPU                                    ▦ Memory
Total   ████████████░░░░░░░  45.2%       Used    ███████████░░░░░░░  58.4%
Load    0.82 / 1.05 / 1.23 (8 cores)     Total   18.7 / 32.0 GB
Core 1  ███████████████░░░░  78.3%       Free    ████████░░░░░░░░░░  41.6%
Core 2  ████████████░░░░░░░  62.1%       Avail   13.3 GB

▤ Disk                                   ⚡ Power
Used    █████████████░░░░░░  67.2%       Level   ██████████████████  100%
Free    156.3 GB                         Status  Charged
Read    ▮▯▯▯▯  2.1 MB/s                  Health  Normal · 423 cycles
Write   ▮▮▮▯▯  18.3 MB/s                 Temp    58°C · 1200 RPM

⇅ Network                                ▶ Processes
Down    ▁▁█▂▁▁▁▁▁▁▁▁▇▆▅▂  0.54 MB/s      Zombies 3 · Chrome (4242) ×3
Up      ▄▄▄▃▃▃▄▆▆▇█▁▁▁▁▁  0.02 MB/s      Code       ▮▮▮▮▯  42.1%
Proxy   HTTP · 192.168.1.100             Chrome     ▮▮▮▯▯  28.3%
```

Der Zustandswert fasst CPU, RAM, Festplattenkapazität, SMART-Status, I/O, Temperatur, Batterie und Uptime zusammen. Drücke `k` für das Kätzchen, `c` zum Umschalten der CPU-Kerne und `q` zum Beenden. Einstellungen werden gespeichert.

<details>
<summary><strong>JSON, NDJSON und Prozess-Warnungen</strong></summary>

- `mo analyze --json ~/Documents`: Gibt den Festplattenbericht einmalig als JSON aus.
- `mo status --json`: Gibt den Systemstatus einmalig als JSON aus.
- `mo status | jq '.health_score'`: Schaltet bei Weiterleitung in Pipes automatisch auf JSON um.
- `mo status --watch --interval 2s`: Streamt NDJSON (durch Zeilenumbrüche getrenntes JSON).
- `mo history --json`: Gibt die Bereinigungshistorie als JSON aus.

```text
$ mo status --json
{
  "host": "MacBook-Pro",
  "health_score": 92,
  "cpu": { "usage": 45.2, "logical_cpu": 8 },
  "memory": { "total": 34359738368, "used": 20078972109, "used_percent": 58.4 },
  "disks": [],
  "process_collected_at": "2026-08-29T12:30:00Z",
  "process_stale": false,
  "zombie_count": 3,
  "zombie_parents": [
    { "pid": 4242, "name": "Google Chrome for Testing", "count": 3 }
  ],
  "zombie_parents_complete": true,
  "uptime": "3d 12h 45m"
}
```

Die Zombie-Prozess-Diagnose dient reinen Informationszwecken; sie beendet keine Prozesse und beeinflusst die Bewertung nicht. Tritt bei einem Erfasser ein Fehler auf, gibt `mo status --json` weiterhin alle verfügbaren Daten aus und beendet mit Code 0.

Warnungen bei hoher CPU-Last können über `--proc-cpu-threshold`, `--proc-cpu-window` oder `--proc-cpu-alerts=false` konfiguriert werden.

</details>

### Projektbereinigung (Purge)

`mo purge` findet neu erstellbare Projekt-Build-Dateien wie `node_modules`, `target`, `.build`, `build` und `dist`. Dateien werden nach Projekten gruppiert und erst nach deiner Bestätigung gelöscht. Innerhalb der letzten 7 Tage aktive Dateien sind standardmäßig abgewählt. Verzeichnisse mit Deployment-Schlüsseln oder getrackten Git-Dateien sind automatisch geschützt. Nicht-interaktiv erfordert `mo purge --yes`; nutze `mo purge --dry-run` zur Voransicht.

Verwende Bild auf/ab oder `h`/`l` zum Blättern, `[`/`]` zum Springen zwischen Projekten und `X` zum Überspringen. `/` sucht nach Pfaden und Namen, `n` findet den nächsten Treffer. Enter bestätigt das Löschen.

<details>
<summary><strong>Purge Beispielausgabe</strong></summary>

```text
$ mo purge

Purge Project Artifacts

Select Artifacts to Purge
6.00GB, 2 selected

➤ ● ┌ ~/Projects/website        3.80GB | node_modules | 28d
  ○ └ ~/Projects/website         186MB | dist         | <1d
  ● ┌ ~/Projects/rust-app       2.20GB | target       | 2mo
  ○ └ ~/Projects/rust-app         22MB | dist         | <7d

======================================================================
Purge complete
Estimated space freed: 6.00GB | Items: 2 | Free: 223.5GB
======================================================================
```

</details>

<details>
<summary><strong>Eigene Suchpfade</strong></summary>

Führe `mo purge --paths` aus oder bearbeite `~/.config/mole/purge_paths` direkt:

```shell
~/Documents/MyProjects
~/Work/ClientA
~/Work/ClientB
```

Sind eigene Pfade hinterlegt, scannt Mole ausschließlich diese Verzeichnisse (Standard: `~/Projects`, `~/GitHub`, `~/dev` usw.). Purge bereinigt nur Build-Caches, niemals Quellcode.

</details>

### Installationsdateien (Installer)

`mo installer` findet DMG-, PKG-, MPKG-, ISO-, XIP- und Installer-ZIP-Dateien in Downloads, Schreibtisch, Homebrew-Caches, iCloud, Mail, Telegram und weiteren typischen Ordnern. Vor dem Löschen werden Größe und Pfad angezeigt. Nutze `mo installer --dry-run` zur Vorschau. Scans verfügen über einen globalen Timeout-Schutz. Vor dem endgültigen Löschen werden Dateien erneut überprüft, um sicherzustellen, dass sie sich nicht verändert haben.

<details>
<summary><strong>Installer Beispielausgabe</strong></summary>

```text
$ mo installer

Select Installers to Remove, 3.83GB, 5 selected

➤ ● Photoshop_2024.dmg          1.20GB | Downloads
  ● IntelliJ_IDEA.dmg          850.6MB | Downloads
  ● Illustrator_Setup.pkg      920.4MB | Downloads
  ● PyCharm_Pro.dmg            640.5MB | Homebrew
  ● Acrobat_Reader.dmg         220.4MB | Downloads
  ○ AppCode_Legacy.zip         410.6MB | Downloads

======================================================================
Installers cleaned
Removed 5 installers, freed 3.83GB
======================================================================
```

</details>

## Schnellstarter

<details>
<summary><strong>Raycast- und Alfred-Einrichtung</strong></summary>

Installiere fünf Starter für Clean, Uninstall, Optimize, Analyze und Status mit einem Befehl:

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/Mole/main/scripts/setup-quick-launchers.sh | bash
```

Das Skript richtet Raycast-Befehle ein und ergänzt vorhandene Alfred-Konfigurationen um Workflows mit den Begriffen `clean`, `uninstall`, `optimize`, `analyze` und `status`.

Raycast-Einrichtung:

1. Öffne **Raycast Settings > Extensions > Script Commands**.
2. Füge `~/Library/Application Support/Raycast/script-commands` als Skriptverzeichnis hinzu.
3. Klicke auf **Reload Script Directories**.

Die Starter erkennen gängige Terminals automatisch (Terminal, iTerm2, Alacritty, kitty, WezTerm, Ghostty, Hyper, WindTerm, Warp). Nutze `MO_LAUNCHER_APP=<name>` zur Festlegung oder starte Mole direkt in [Kaku](https://github.com/tw93/Kaku).

</details>

## Community

Vielen Dank an alle Mitwirkenden, die Mole voranbringen ❤️

<a href="https://github.com/tw93/Mole/graphs/contributors">
  <img src="./CONTRIBUTORS.svg?v=2" alt="Mole Mitwirkende" width="1000" />
</a>

<br/><br/>
Echtes Feedback von Nutzern auf X (Twitter):

<img src="./docs/img/mole-love.png" alt="Community-Feedback zu Mole" width="1000" />

## Unterstützung

- Der Kauf von [Mole for Mac](https://mole.fit) ist die direkteste Art, die Entwicklung von Mole zu unterstützen.
- Wenn dir Mole hilft, gib dem Projekt einen Stern, [teile es auf X](https://twitter.com/intent/tweet?url=https://github.com/tw93/Mole&text=Mole%20-%20Deep%20clean%20and%20optimize%20your%20Mac.) oder erstelle ein Issue/PR.
- Ich habe zwei Katzen: TangYuan und Coke. Wenn Mole dir gefällt, spendiere ihnen gerne eine Dose <a href="https://cats.tw93.fun?name=Mole" target="_blank">Katzenfutter 🥩</a>.

<details>
<summary>Diese wunderbaren Unterstützer haben das bereits getan 🐱</summary>
<br/>
<a href="https://cats.tw93.fun?name=Mole"><img src="https://cdn.jsdelivr.net/gh/tw93/sponsors@main/assets/sponsors.svg" alt="Mole Unterstützer" width="1000" loading="lazy" /></a>
</details>

## Lizenz

Mole ist Open Source unter der GPL-3.0; siehe [LICENSE](LICENSE). Modifizierte und weitergegebene Versionen müssen unter derselben Lizenz verbleiben. Bei einem Fork verwende bitte einen eigenständigen Namen und nenne Mole als Upstream-Quelle.

[Mole for Mac](https://mole.fit) ist eine separate native Desktop-Applikation.
