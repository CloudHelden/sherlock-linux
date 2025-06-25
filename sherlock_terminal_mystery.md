# Sherlock Holmes – **Der Fall des gestohlenen Pakets 🕵️‍♂️** 

![Sherlock 1](/bilder/sherlock1.jpeg)


London, Dezember 1895: Dichter Kohlerauch legt sich wie ein Leichentuch auf die Stadt. In den Katakomben des Innenministeriums wurde ein Band streng geheimer Telegramme gestohlen. Die Spur führt in einen experimentellen **Ubuntu‑Mainframe** – dampfbetrieben, zahnradsurrend, gespeist von Lochkarten und Elektronen­röhren.

Inspector Lestrade ist ratlos. **Sherlock Holmes** – Meister der Deduktion – und **du** – sein neuer Technik‑Conduktor – sollen den Täter entlarven. Jeder Linux‑Befehl wird zur Sprungmarke in diesem Labyrinth aus Kupfer­drähten und Null‑Byte‑Schlupfwinkeln.

> *„Mein lieber Freund, wer der Shell lauscht, hört die Wahrheit der Maschinen.“* – S. Holmes

🎧 **Sherlock-Playlist:** [Sherlock Soundtrack](https://open.spotify.com/intl-de/album/4eouZPpapIAd6TvYkUTGDq?si=2HfBDGdHSpOniCuJbUzL2A)

🏁 **Erstsetup:**  Führe das Bash‑Skript `` aus – es erzeugt alle Beispiel­ordner & Dateien, die wir im Abenteuer nutzen.

---

## 📜 Inhaltsverzeichnis

| Kapitel | Befehl                                                                                             | Thema                    |
| ------- | -------------------------------------------------------------------------------------------------- | ------------------------ |
| 1       | [`pwd`](#kapitel-1)                                                                                | Standort lokalisieren    |
| 2       | [`ls`](#kapitel-2)                                                                                 | Akten sichten            |
| 3       | [`cd`](#kapitel-3)                                                                                 | Gassen wechseln          |
| 4       | [`touch`](#kapitel-4)                                                                              | Spuren hinterlassen      |
| 5       | [`cat`](#kapitel-5)[ & ](#kapitel-5)[`less`](#kapitel-5)                                           | Dokumente lesen          |
| 6       | [`cp`](#kapitel-6)                                                                                 | Beweise duplizieren      |
| 7       | [`mv`](#kapitel-7)                                                                                 | Umschlag & Transport     |
| 8       | [`mkdir`](#kapitel-8)                                                                              | Verstecke bauen          |
| 9       | [`rm`](#kapitel-9)                                                                                 | Spuren tilgen            |
| 10      | [`file`](#kapitel-10)                                                                              | Artefakte identifizieren |
| 11      | [`find`](#kapitel-11)                                                                              | London durchkämmen       |
| 12      | [`history`](#kapitel-12)                                                                           | Chronik prüfen           |
| 13      | [`man`](#kapitel-13)[, ](#kapitel-13)[`help`](#kapitel-13)[, ](#kapitel-13)[`whatis`](#kapitel-13) | Wissen zapfen            |
| 14      | [`alias`](#kapitel-14)                                                                             | Deduktive Kurzbefehle    |
| 15      | [`exit`](#kapitel-15)                                                                              | Fall abschließen         |
| 16      | [Lösung](#lösung-spoiler)                                                                          | Walk‑through             |

---

## Kapitel 1 – `pwd`

### Szene 🕯️

*Baker Street 221B, 06:04 Uhr.* Ein fahles Dämmerlicht sickert durch dichte Vorhänge, wirft Muster auf persische Teppiche. Die Luft riecht nach Assam‑Tee, Pfeifen­tabak und warmem Bienenwachs. Holmes, in wollenen Hausschuhen, lässt den letzten Ton einer nächtlichen Violin‑Improvisation verklingen. Er drückt eine Taste auf dem surrenden Teleprinter – ein Wunderwerk aus Messing, Glas und rot glimmenden Röhren.  
„Watson, ein jeder Pfad hat einen Ursprung. Bevor wir die Jagd beginnen, präzisieren wir unsere Koordinaten.“  
Der Cursor hüpft, als du die Finger aufs Bakelit‑Keyboard legst. Noch hallt das Klangholz der Geige nach, während der Befehl `pwd` in die Stille klickt – der erste Schritt in ein Datenlabyrinth, das sich von Whitehall bis Limehouse spannt.

### Was macht der Befehl?

`pwd` zeigt dir den **vollständigen Pfad** zu deinem aktuellen Ordner.  
* Ohne Optionen: logischer Pfad.  
* Mit `-P`: echter Pfad ohne Verknüpfungen (Symlinks).


### Warum wichtig?

- **Kontext­kontrolle** – Skripte sollen wissen, wo sie starten.
- **Debugging** – Pfad­verwechslungen aufdecken.
- **Dokumentation** – Logs mit Pfad versehen.

### Cheat‑Sheet

```bash
pwd       # logischer Pfad (Standard)
pwd -P    # physischer Pfad, Symlinks aufgelöst
```

> **Symlink‑Mini‑Exkurs:** Ein symbolischer Link ist wie ein Weg­weiser. `pwd -P` folgt dem Pfad bis zur echten Tür.

---

### ⌨️ Schritt-für-Schritt-Anleitung

```bash
# 1 : Ins Home-Verzeichnis wechseln
cd ~

# 2 : (Nur beim 1. Mal) symbolischen Link anlegen
ln -s ~/Investigation ~/Investigation_symlink

# 3 : In den Symlink hineingehen
cd ~/Investigation_symlink

# 4 : Pfade vergleichen
pwd        # zeigt logischen Pfad  →  /home/<user>/Investigation_symlink
pwd -P     # zeigt physischen Pfad →  /home/<user>/Investigation
```

> **Merke:** Die Umgebungsvariable `$PWD` enthält *immer* den logischen Pfad.   
> Für Skripte, die den echten Ort brauchen, verwende `$(pwd -P)`.

### 📝 Hands-on-Mission 🔍

1. Führe die vier Kommandos oben aus.  
2. Notiere beide Ausgaben (`pwd`, `pwd -P`) in dein Notizbuch.  

### Holmesian Insight

> In *Bash* ist `$PWD` immer der logische Pfad. Für den physischen benutzt du `$(pwd -P)` in Skripten.

### Quizfrage

Welches Flag **löst** Symlinks auf und zeigt den physischen Pfad?  
<details><summary>Klicke für die Antwort</summary><code>-P</code></details>
---

## Kapitel 2 – `ls`

![Sherlock 2](/bilder/sherlock2.jpeg)


### Szene 📂

*Innenministerium, Archiv‑Souterrain, 08:15 Uhr.* Eine gewundene gusseiserne Treppe führt hinab in dunstige Tiefe. Wasser tropft in Pfützen; die Luft schmeckt nach altem Papier und feuchtem Ziegel. Zahllose Aktenschränke, bis zur Decke gestapelt, ziehen sich in Korridore davon wie Regimenter. Gaslampen werfen flackernde Lichtkegel, die Schatten tanzen lassen.  
Ein nervöser Archivbeauftragter wischt sich den Schweiß von der Stirn: „Es fehlen Schubladen – aber welche?“  
Holmes gleitet mit Handschuhspitzen über Messingschilder, murmelt „inventarium totius“ – dann sieht er dich an. Das Terminal, auf einem improvisierten Pult aus Kisten, wartet. Deine Aufgabe: mit einem simplen `ls -la` Licht in das Schattenregister der Dateien zu bringen.

### 🗺️ Vorbereitung – kurz zu `cd`

Bevor du irgendeinen `ls`-Befehl ausprobierst, musst du im **richtigen Ordner** stehen.  
Nutze dafür `cd` (change directory):

```bash
cd ~/Investigation          # in den Ermittlungsordner wechseln
pwd                         # Kontrolle: Pfad sollte …/Investigation lauten
```
---

### Was macht der Befehl?

`ls` listet **Dateien und Unterordner**.  
* `-l` Details (Größe, Datum, Rechte)  
* `-a` auch versteckte Dateien (Dot-Files) anzeigen  
* `-h` menschen­lesbare Größen (in Kombi mit `-l`)

---

### Warum wichtig?

* **Schnell­inventur** – Inhalt & versteckte Dateien sichtbar machen  
* **Rechte-Check** – wer darf was lesen/schreiben  
* **Sortierte Listen** – z. B. mit `--sort` oder `--group-directories-first`

---
### Cheat‑Sheet

```bash
ls              # kompakte Liste
ls -l           # Langformat (Rechte, Größe, Datum)
ls -la          # inklusive versteckter Dateien
ls -lh          # Größen in KB/MB/GB
ls -lt          # sortiert nach Datum absteigend
```
### Beispiele aus dem Fall

```bash
cd ~/Investigation
ls -la | head                       # erste Einträge anzeigen

ls -lh --group-directories-first /var/spool/telegraphs
```

---

### Hands-on-Mission 🗂️

1. Wechsle in den Ermittlungsordner  
   ```bash
   cd ~/Investigation
   ```
2. Führe `ls -l` aus und **notiere** die Rechte (`drwx` …) von `mysterious.bin`.
3. Liste chronologisch – jüngstes zuerst – mit  
   ```bash
   ls -lrt
   ```  
   Welcher Eintrag steht jetzt ganz unten?

---

### Holmesian Insight

> `ls -ld */` listet **nur** Verzeichnisse im aktuellen Ordner – praktisch für große Repositories.


---

## Kapitel 3 – `cd`

![Sherlock 3](/bilder/sherlock3.jpeg)


### Szene 🚕

*Regent Street, 09:00 Uhr.* Pferde‑Hufe trommeln, das Pflaster glänzt vor Nieselregen. Im Inneren einer klapprigen Droschke schaukeln Holmes, Lestrade und du zwischen Lederriemen und dampfend beschlagenen Scheiben. Holmes klappt seinen tragbaren Telegraphen­kasten auf; grüne Funken jagen über die Röhren.  
„Unser Ziel ist `/var/log`, Watson – dort, wo Maschinen Gewissen zeigen.“  
Die Droschke nimmt eine Kurve, und du spürst jede Kopfstein‑Erhebung, als deine Finger das Kommando eingeben: `cd /var/log`. Ein Ortswechsel zugleich im Nebel Londons und in den Adern des Mainframes.

### Was macht der Befehl?

`cd` **wechselt den Ordner**.  
* `cd ..` eine Ebene hoch.  
* `cd -` zurück zum vorherigen Ordner.  
* `cd` (ohne Pfad) springt ins Home‑Verzeichnis.

### Warum wichtig?

- **Navigation** – wechsel blitzschnell zwischen Projekt­bäumen.
- **Build‑Skripte** – temporär in Build‑Ordner wechseln.
- **Shell‑Shortcuts** – `cd -` als Undo; `cd` ohne Arg → `$HOME`.

### Cheat‑Sheet

| Kürzel | Bedeutung         | Beispiel |
| ------ | ----------------- | -------- |
| `..`   | eine Ebene hoch   | `cd ..`  |
| `.`    | aktueller Ordner  | `cd .`   |
| `~`    | dein Home         | `cd ~`   |
| `-`    | vorheriger Ordner | `cd -`   |
| `/`    | Root (/)          | `cd /`   |

### Beispiele aus dem Fall

```bash
$ cd /var/log
$ less syslog | head
$ cd -            # zurück zur Baker Street
```

### Hands‑on‑Mission 🏇

*Wechselpfad‑Parcours*:

```bash
cd ~/Investigation && pwd
cd /tmp && pwd
cd -       # zurück
cd ../..   # zwei Ebenen hoch
```

Notiere jeden Pfad.

### Holmesian Insight

> `pushd`/`popd` (Bash built‑ins) verwalten ein Directory‑Stack – ideal für verschachtelte Projekte.

### Quizfrage

Welches Kürzel springt ins vorherige Verzeichnis? → ``

---

## Kapitel 4 – `touch`

> **Lernziel:** Dateien anlegen ➜ Zeitstempel verstehen ➜ Platzhalter erstellen

---

### 🖋️ Szene

*Posthof am Themse-Kai, 22 : 30 Uhr.*  
Dichter Nebel wabert über altersschwärz­liches Kopfsteinpflaster. Sirenen eines fernen Dampfschiffs hallen, Möwen schreien.  
Holmes kniet im Kegel einer Bullaugen-Laterne und deutet auf einen klaren Schuhabdruck mit Zickzack-Profil.

> „Digitale Kreide, Watson. Wir markieren diesen Fund für spätere Analysen.“

Du klappst deinen A-Speicher-Laptop auf; der Ventilator kämpft gegen die feuchte Luft.  
Ein leiser Klick – `touch footprint.txt` – und ein unsichtbarer Pfosten steht nun im Dateisystem.

---

### 🛠️ Was macht `touch`?

| Option | Wirkung                              | Praxis-Beispiel                   |
|--------|--------------------------------------|-----------------------------------|
| _(ohne)_ | legt Datei an **oder** aktualisiert beide Zeitstempel | `touch neueNotiz.txt` |
| `-a`    | nur *Access Time* ändern            | `touch -a geheim.txt`             |
| `-m`    | nur *Modify Time* ändern            | `touch -m bericht.md`             |
| `-t`    | manuellen Zeitstempel setzen (YYYYMMDDhhmm.ss) | `touch -t 189512120101 clue1` |

> Eine Datei sieht nach dem Befehl identisch aus – nur ihre Metadaten wurden verändert.

---

### 🎯 Warum wichtig?

1. **Platzhalter** – leere Config- oder Log-Files im Git-Repo festhalten.  
2. **Build-Trigger** – bei `make` oder CI/CD Force-Rebuild auslösen.  
3. **Forensik** – Zeitstempel zurücksetzen, um Reihen­folgen sichtbar zu machen.

---

### 📑 Cheat-Sheet

```bash
touch file              # neu oder Zeit aktualisieren
touch -a file           # nur Zugriffszeit
touch -m file           # nur Änderungszeit
touch -t 202501010000.00 file   # auf 1. Jan 2025 00:00 setzen
```

---

### 🗂️ Beispiele aus dem Fall

```bash
# 1) Abdruck markieren
touch ~/Investigation/footprint.txt

# 2) Historischen Stempel simulieren (12. Dez 1895, 00:01)
touch -a -t 189512120001 ~/Investigation/footprint.txt
```

---

### 👣 Hands-on-Mission

1. **In den Ermittlungsordner wechseln**
   ```bash
   cd ~/Investigation
   ```
2. **Änderungszeit aktualisieren**
   ```bash
   touch -m footprint.txt
   ```
3. **Drei neue Hinweise anlegen**
   ```bash
   touch clue1 clue2 clue3
   ```
4. **Kontrolliere die Zeitstempel**
   ```bash
   ls -l --time=modify footprint.txt clue*
   ```

> ✏️ Notiere, welche Datei jetzt den *neuesten* Änderungszeitstempel trägt.

---

### 🧠 Holmesian Insight

> **Build-Systeme** wie `make` oder Ninja verlassen sich **komplett** auf Zeitstempel. Ein versehentlich falsches Datum kann einen Full-Rebuild erzwingen – oder verhindern, dass wichtige Dateien neu gebaut werden.

---

### ❓ Quizfrage

Welches Flag aktualisiert **nur den Zugriffs-Zeitstempel**?  
<details><summary>Antwort anzeigen</summary><code>-a</code></details>
---

## Kapitel 5 – `cat` & `less`

> **Lernziel:** kleine Dateien schnell ansehen (`cat`) – große Dateien bequem durchblättern (`less`) – Such‑ & Filterfunktionen nutzen

---

### 📖 Szene

*Baker Street 221B, Kaminzimmer, 00 : 45 Uhr.*  
Wind heult im Schornstein, wirbelt Funken aus dem Kamin, die kurz in der Luft tanzen.  
Auf Sherlocks Mahagoni‑Tisch liegen zwei Fundstücke:

1. **note.txt** – eine zusammengefaltete Notiz, Teeflecken zieren die Ecken.  
2. **server.log** – ein rußgeschwärztes Logbuch, so schwer, dass das Holz knackt.

Holmes zündet die Öllampe. „Beginnen wir mit dem Kleinen“, flüstert er.  
`cat note.txt` lässt drei kryptische Zeilen aufblitzen – ein Rätsel im Rätsel.  
Dann ruft er: „Für das Logbuch brauchen wir eine Lupe für Bits!“  
`less server.log` klappt den digitalen Folianten seitenweise auf; das Rauschen alter Prozesse füllt den Raum wie leises Bibliotheks‑Gemurmel.

---

### 🛠️ Was machen die Befehle?

| Befehl | Wann einsetzen? | Kern‑Eigenschaft |
|--------|-----------------|------------------|
| `cat file` | **kleine** Dateien | Inhalt sofort komplett anzeigen |
| `less file` | **mittlere & große** Dateien | Blättern, suchen, filtern – ohne Speicherfresser |

---

### 🔍 Warum wichtig?

* **Schnellcheck** – Konfig‑ oder Notizdateien im Handumdrehen öffnen.  
* **Log‑Forensik** – Tausende Zeilen scrollen & filtern, ohne Editor zu starten.  
* **Pipelines** – `cat file | grep pattern` oder `grep pattern file | less`.

---

### 📑 Cheat‑Sheet für `less`

| Taste | Aktion |
|-------|--------|
| `Space` / `PgDn` | eine Seite vor |
| `b` / `PgUp` | eine Seite zurück |
| `/Text` | vorwärts suchen |
| `?Text` | rückwärts suchen |
| `n` / `N` | nächster / vorheriger Treffer |
| `&Muster` | **Filter** – nur Zeilen mit Muster zeigen |
| `g` / `G` | Anfang / Ende |
| `q` | beenden |

> **Tipp:** In `less` zeigt `:n` die nächste Datei einer Übergabe­liste; `:p` die vorherige.

---

### ⚡ Beispiel­Commands

```bash
# 1) Kleine Notiz einfach anzeigen
cat ~/Investigation/note.txt

# 2) Server‑Log seitenweise öffnen, direkt zum Wort "Suspicious" springen
less +/Suspicious ~/Investigation/server.log
```

---

### 👣 Hands‑on‑Mission

1. **Wechsle in den Ermittlungsordner**
   ```bash
   cd ~/Investigation
   ```

2. **Öffne das Logbuch**
   ```bash
   less server.log
   ```

3. **Filtere alle Zeilen, die „Error“ enthalten**  
   *(Innerhalb von `less` tippen)*  
   ```
   &Error
   ```
   Mit `n` springst du durch die Treffer.  
   Drücke `q`, um `less` wieder zu verlassen.

> ✏️ Notiere, wie viele Error‑Zeilen angezeigt wurden.

---

### 🧠 Holmesian Insight

> `cat file | less` ist unnötig – `less` kann Dateien selbst lesen.  
> Eine **Pipe** zu `less` brauchst du nur, wenn der vorangestellte Befehl *transformiert* (z. B. `grep`, `jq`, `sort … | less`).

---

### ❓ Quizfrage

Welche Taste beendet `less`?  
<details><summary>Antwort anzeigen</summary><code>q</code></details>

---

## Kapitel 6 – `cp`

> **Lernziel:** Dateien / Ordner sicher duplizieren, Attribute bewahren, Überschreiben vermeiden.

---

### 📦 Szene

*Bahndepot King’s Cross, 02 : 05 Uhr.*  
Dampflokomotiven zischen, Funken stieben an gusseisernen Bögen empor. Zwischen riesigen Holzcontainern steht **eine einzelne Kiste** mit dem blassen Stempel **Dossier 42**. Ticktack einer Bahnhofsuhr – jede Sekunde ein Hammerschlag.

Holmes bricht das Siegel, sieht dich an:

> „Original für Scotland Yard, Kopie für uns – **mit sämtlichen Metadaten**.“

Du stellst dein Terminal auf einen quietschenden Gepäckwagen.  
`cp -a -v` versiegelt den perfekten Zwilling: Rechte, Zeitstempel und even­tuelle Symlinks – nichts entgeht der Archivoption `-a`.

---

### 🛠️ Was macht `cp`?

| Option | Wirkung | Praxis-Beispiel |
|--------|---------|-----------------|
| _(ohne)_ | Datei(en) kopieren | `cp foo.txt bar.txt` |
| `-i` | **i**nteraktiv – fragt vor Überschreiben | `cp -i foo.txt bar.txt` |
| `-r` | Ordner **r**ekursiv kopieren | `cp -r dir backup_dir` |
| `-v` | **v**erbose – zeigt jede Kopie | `cp -v src dest/` |
| `-a` | **a**rchive: Rechte, Zeit & Links beibehalten (`-dR --preserve=all`) | `cp -a src/ dest/` |

> ⚠️ **Achtung**: Ohne `-i` überschreibt `cp` kommentarlos gleichnamige Dateien!

---

### 🚩 Warum wichtig?

1. **Backups** – Arbeitskopien anlegen, bevor du editierst.  
2. **Staging** – Dateien aus Dev → Prod fold­ern schieben, ohne Attribute zu verlieren.  
3. **Deploy-Skripte** – schnell & portabel, da `cp` auf jedem POSIX‑System vorhanden ist.

---

### 📑 Cheat‑Sheet

```bash
cp file          copy/
cp -i file copy/             # fragt vorher
cp -vr src/ data_backup/     # rekursiv, verbose
cp -a dossier/ Case42/       # inkl. Rechte, Zeiten & Links
```

---

### ⚡ Beispiel aus dem Fall

```bash
# Dossier 42 als 1‑zu‑1 Kopie sichern
cp -a -v ~/Investigation/dossier ~/Archive/Case42/
```

Ausgabe (gekürzt):

```
'~/Investigation/dossier' -> '~/Archive/Case42/dossier'
'~/Investigation/dossier/file1.txt' -> '~/Archive/Case42/dossier/file1.txt'
…
```

---

### 👣 Hands‑on‑Mission

1. **Dossier kopieren** – alle Attribute bewahren
   ```bash
   cp -a -v ~/Investigation/dossier ~/Archive/Case42/
   ```

3. **Vergleichen** – Stimmen Rechte & Größe überein?
   ```bash
   ls -ld ~/Investigation/dossier
   ls -ld ~/Archive/Case42/dossier
   ```

4. **Test: Überschreiben verhindern**  
   ```bash
   cp -i ~/Investigation/note.txt ~/Archive/Case42/note.txt
   # → Terminal fragt: überschreiben?  (y/N)
   ```

> ✏️ Notiere, ob die beiden `ls -ld`‑Ausgaben identisch sind.

---

### 🧠 Holmesian Insight

> Für **große Mengen** oder **remote Backups** ist `rsync -a --progress` oft schneller und kann nur die geänderten Blöcke übertragen – behält aber dieselben Attribute.

---

### ❓ Quizfrage

Mit welchem Flag behält `cp` **alle** Zeitstempel und Rechte?  
<details><summary>Antwort anzeigen</summary><code>-a</code></details>
---

## Kapitel 7 – `mv`

> **Lernziel:** Dateien/Ordner sicher umbenennen oder verschieben – Überschreiben vermeiden – automatische Backups nutzen  

---

### 📑 Szene

*Themse‑Promenade, 02 : 17 Uhr.*  
Nebel­schwaden fegen über schwankende Gas­lampen. Holmes entrollt **secret.txt**; das Papier raschelt wie eine Nachteule.

> „Ein derart plakativer Name schreit nach Misstrauen.“

Er schiebt das Dokument in einen Umschlag eines unscheinbaren Regenschirm‑Herstellers.  
Dein Kommando `mv -b secret.txt umbrella_letter.txt` ist das digitale Pendant – ein **lautloser Identitäts­wechsel**.  
`-b` erstellt dabei automatisch eine Sicherheitskopie (`secret.txt~`) – falls Scotland Yard später die Beweiskette prüft.

---

### 🛠️ Was macht `mv`?

| Option | Wirkung | Beispiel |
|--------|---------|----------|
| _(ohne)_ | Datei/Ordner verschieben **oder** umbenennen | `mv foo.txt bar.txt` |
| `-i` | **i**nteraktiv – fragt, bevor etwas überschrieben wird | `mv -i log.txt backup/` |
| `-b` | **b**ackup – erstellt Kopie `<name>~` vor dem Überschreiben | `mv -b draft.txt final.txt` |
| `-n` | **n**o‑clobber – überschreibt nie (still schweigend) | `mv -n *.jpg gallery/` |

> **Merke:** `mv` überschreibt standard­mäßig **kommentarlos**. Nutze mindestens `-i` oder `-b`, wenn dir Daten wichtig sind.

---

### 🚩 Warum wichtig?

1. **Projekt­struktur ändern** – Dateien in neue Ordner sortieren.  
2. **Refactor** – Code‑Module in Micro‑Services verschieben.  
3. **Tarnung & Privacy** – sensible Dateien umbenennen (`secret.txt` ➜ `umbrella_letter.txt`).  
4. **Rollback** – mit `-b` erhältst du automatisch eine Kopie für den Notfall.

---

### 📑 Cheat‑Sheet

```bash
mv OLD NEW                 # umbenennen
mv FILE DIR/               # verschieben
mv -i FILE DIR/            # nachfragen
mv -b FILE NEW             # Backup (~) vor Überschreiben
mv -n FILE DIR/            # nie überschreiben
```

---

### ⚡ Beispiel aus dem Fall

```bash
# Gehe in den Ermittlungsordner
cd ~/Investigation

# Umbennen & Backup anlegen
mv -b secret.txt umbrella_letter.txt
# erzeugt zusätzlich: secret.txt~
```

---

### 👣 Hands‑on‑Mission 🎩

1. **Wechsle in den Ermittlungsordner**  
   ```bash
   cd ~/Investigation
   ```

2. **Verschiebe den Schuhabdruck ins Beweisarchiv** (mit Rückfrage)  
   ```bash
   mv -i footprint.txt ~/Beweisarchiv/evidence.dat
   ```

3. **Kontrolliere**, dass im Zielordner `evidence.dat` liegt und im Quellordner `footprint.txt` verschwunden ist.  
   ```bash
   ls ~/Beweisarchiv
   ```

4. **Teste den `-n`‑Schutz**  
   ```bash
   mv -n umbrella_letter.txt ~/Beweisarchiv/   # wird NICHT überschreiben
   echo "Exit-Code: $?"                        # sollte 1 oder 0? prüfen
   ```

> ✏️ Notiere, ob eine Backup‑Datei (`umbrella_letter.txt~`) entstanden ist.

---

### 🧠 Holmesian Insight

> Ein versehentlich überschriebenes Dokument? Schau nach einer Datei mit `~` am Ende – das ist dein Rettungs­anker, den `mv -b` automatisch erzeugt.

---

### ❓ Quizfrage

Welches Flag erstellt automatisch eine **Backup‑Kopie** mit Tilde (`~`) am Ende?  
<details><summary>Antwort anzeigen</summary><code>-b</code></details>
## Kapitel 8 – `mkdir`

### Szene 🏛️

*Scotland Yard, Dachboden, 03:50 Uhr.* Zwischen Staubflusen und vergilbten Kriegsrelikten schwebt ein dünner Lichtkegel einer Taschenlampe. Holmes stößt eine Holzkiste beiseite, enthüllt eine Wand alter Karteikarten. „Hier richten wir unser Archiv ein – mehrstufig, wie russische Matrjoschka.“  
Auf einem ziegelroten Ziegelstein‑Vorsprung startet dein Terminal. `mkdir -vp ~/Holmes/Archive/1895/Blackwood` ackert sich durch die Hierarchie; jeder `-v`‑Echo‑Satz hallt im Dachstuhl wider wie Hammerschläge eines heimlichen Zimmermanns.

### Was macht der Befehl?

`mkdir` **erstellt Ordner**.  
* `-p`: ganze Pfadkette in einem Schritt.  
* `-v`: zeigt jeden angelegten Ordner an.

### Warum wichtig?

- **Struktur** – Projekt‑ & Backup‑Pfad­gerüste.
- **Skript‑Automation** – Config‑Pfade anlegen.

### Cheat‑Sheet

```bash
mkdir dir            # einzelner Ordner
mkdir -p a/b/c       # gesamte Pfadkette
mkdir -v             # verbose (anzeige)
```

### Beispiele aus dem Fall

```bash
$ mkdir -vp ~/Holmes/Archive/1895/Blackwood
```

### Hands‑on‑Mission 🏗️

Lege `~/ScotlandYard/Case42/Revolver` mit einem Befehl an.

### Holmesian Insight

> Vermeide `mkdir -p` mit Leerzeichen (z.B. `~/My Folder`) – nutze Anführungs­zeichen oder `\ `.

### Quizfrage

Flag für *verbose* Ausgabe? → ``

---

## Kapitel 9 – `rm`

### Szene 💣

*Fleet‑Street‑Lagerhaus, 04:30 Uhr.* Ein Seilzug quietscht, tropfendes Kondensat prasselt in aufgerostete Ölfässer. Auf einem Apfelkisten‑Podest blinkt `trap.sh` in giftgrünem Phosphor. Ein falscher Klick, und die wahrhaften Beweise könnten gelöscht – oder schlimmer – verschlüsselt werden.  
Holmes löst elegant den Sicherheitssplint in seinem Spazierstock. Du löst digital, aber ebenso präzise: erst `rm -i /tmp/trap.sh` – die Shell fragt, du bestätigst. Dann `rm -rf /tmp/footprints`, das virtuelle Besen‑Team, das jeden Sandkorn‑Abdruck tilgt.

### Was macht der Befehl?

`rm` **löscht Dateien oder Ordner**.  
* `-r`: Ordner samt Inhalt.  
* `-f`: erzwingt Löschen ohne Nachfrage.  
* `-i`: fragt vorher.

### Warum wichtig?

- **Aufräumen** – Logs, Temp, Malware.
- **Sicherheits­hygiene** – heikle Keys vernichten.

### Cheat‑Sheet

```bash
rm file          # Datei
rm -i file       # interaktiv
rm -r dir        # rekursiv
rm -rf dir       # ohne Rückfrage
rm -I dir        # Nachfragen, falls >3 Files
```

### Beispiele aus dem Fall

```bash
$ rm -I -r /tmp/footprints   # fragt 1× vor rekursivem Löschen
$ rm -f /tmp/trap.sh         # zwingend löschen
```

### Hands‑on‑Mission 🔥

1. Entferne `trap.sh` interaktiv (`-i`).
2. Lösche `/tmp/footprints` mit `rm -rf`.

### Holmesian Insight

> Für wirklich sicheres Löschen nutze `shred` oder `srm` – `rm` entfernt nur Inode‑Referenzen.

### Quizfrage

Kombi für klares, stilles Rekursiv‑Löschen? → ``

---

## Kapitel 10 – `file`

### Szene 🔬

*221B, Chemielabor, 05:10 Uhr.* Knisternde Tesla‑Spulen tauchen die Regale in fliederfarbenes Licht. `mysterious.bin` liegt auf einer Antistatik‑Platte. Holmes’ Augen verengen sich hinter Schutzbrille Nr. 3. „Ist das lauernde Dynamit oder nur theater­reifes Blendwerk?“  
Du lässt nicht Spektrometer noch Röntgen sprechen, sondern das Terminal: `file mysterious.bin`. In Mikro­sekunden liest der Befehl die ersten Bytes – die „Fingerabdrücke“ – und entlarvt, was selbst ein Chemielabor vielleicht übersehen hätte.

### Was macht der Befehl?

`file` **erkennt den Dateityp** anhand erster Bytes.  
Praktisch zum Entlarven getarnter Dateien.

### Warum wichtig?

- **Enttarnen** – gefälschte Erweiterungen.
- **Skriptgesteuerte Batch‑Checks** (z.B. CI‑Pipelines).

### Cheat‑Sheet

```bash
file foo        # Typbeschreibung
file -i foo     # MIME‑Typ (text/plain, image/jpeg …)
```

### Beispiele aus dem Fall

```bash
$ file ~/Investigation/mysterious.bin   # „ELF 64‑bit LSB executable“
$ file -i ~/LightBackup/evidence.jpg    # „image/jpeg; charset=binary“
```

### Hands‑on‑Mission 🧪

Vergleiche Ausgabe für `mysterious.bin` vs. `evidence.jpg`.

### Holmesian Insight

> `file --mime-type` | `awk` kann anhand MIME Strings automatisierte Sortierungen vornehmen.

### Quizfrage

Befehl für MIME‑Typ? → ``

---

## Kapitel 11 – `find`

### Szene 🕵️‍♀️

*Telegraphen‑Keller, Whitehall, 05:55 Uhr.* Zahnräder rattern, Lochkarten regnen klackernd in Sortier­boxen. Die Luft ist elektrisch; Ozongeruch mischt sich mit Maschinenöl. Kleine Büro‑Hochöfen spucken Rauchkringel. Die *Baker Street Irregulars* wuseln über Laufstege, Morsekästchen in Händen, senden Blinksignale.  
Dein Terminal steht auf einem Gestell aus Zahnrad‑Gehäusen. `find` wird zum digitalen Spürhund, schlüpft durch Wartungs­schächte der Dateistruktur, klettert durch Symbol­links, bis er jeden Byte‑Schlupfwinkel ausgeleuchtet hat.

### Was macht der Befehl?

`find` **durchsucht Ordnerbäume** nach Namen, Zeit, Größe usw.  
* `-name "*.log"` nach Dateinamen.  
* `-mtime -1` nach Änderungszeit (< 24 h).  
* `-exec COMMAND {} +` führt Aktionen auf Treffer aus.

### Warum wichtig?

- **Forensik** – verdächtige Dateien nach Zeit/Name/Größe.

### Cheat‑Sheet

```bash
find PATH -name "*.log"                   # Namefilter
find PATH -type f -mtime -1               # <24 h alt
find PATH -size +100M -delete             # große Dateien löschen
find PATH -name "*.tgf" -exec wc -l {} +  # Batch‑Kommando
```

### Beispiele aus dem Fall

```bash
$ find /var/spool/telegraphs -name "*.tgf" -printf "%TY-%Tm-%Td %p\n"
```

### Hands‑on‑Mission 🐶

Suche alle `.conf`‑Dateien in `/etc`, jünger als 7 Tage (siehe Cheat‑Sheet).

### Holmesian Insight

> Mit `-prune` kannst du Pfade ausklammern, z.B. `find / -path /proc -prune -o -name '*.key' -print`.

### Quizfrage

Test für „jünger als N Tage“? → ``

---

## Kapitel 12 – `history`, `!!`, `Ctrl‑R`

### Szene ⌛

*Baker Street, 06:20 Uhr.* Der Morgen graut. Teetassen klirren, während Holmes Stapel gelochter Fern­schreibbänder studiert. „Maschinen haben ein Elefanten­gedächtnis, Watson. Sie protokollieren jede Finger­bewegung.“  
Deine Bash‑History ist das elektronische Pendant: 884 Zeilen Befehls‑Gewissen, das `history | tail` ans Tageslicht bringt, `Ctrl‑R` wie ein Deduktions‑Rückspiegel.

### Was macht der Befehl?

`history` zeigt **deine bisherigen Befehle**.  
* `!!` wiederholt den letzten.  
* `Ctrl‑R` sucht rückwärts im Verlauf.

### Warum wichtig?

- **Productivity** – lange Befehle erneut ausführen.
- **Audit** – nachsehen, was jemand getan hat.

### Cheat‑Sheet

```bash
history | tail       # letzte Zeilen
!!                   # repeat last
!git                 # letzter Befehl, der mit git beginnt
!$                   # letzter Parameter des vorigen Befehls
Ctrl-R grep          # rückwärts suchen
```

### Beispiele aus dem Fall

```bash
$ history | tail -n5
$ !!       # wiederholt soeben angesehenen Befehl
```

### Hands‑on‑Mission ⏲️

Finde via `Ctrl‑R` den letzten SSH‑Befehl (falls vorhanden) und wiederhole ihn.

### Holmesian Insight

> In `~/.bash_history` fehlen Zeitstempel? Setze `HISTTIMEFORMAT="%F %T "` in deiner `~/.bashrc`.

### Quizfrage

Shortcut für Rückwärts‑Suche? → ``

---

## Kapitel 13 – `man`, `help`, `whatis`

### Szene 📚

*Royal College of Surgeons, Lesesaal, 09:30 Uhr.* Sonnenstrahlen brechen durch bleiverglaste Fenster, tanzen auf Staubkörnchen wie Gold­schimmer. Zwischen Regalen hochgestapelter Inkunabeln schlägt Holmes schwere Folianten auf; das Rascheln erschreckt eine dösende Bibliothekskatze.  
Du öffnest dein Terminal; ASCII‑Seiten rauschen wie Zeitung durch eine Druckpresse. Jede `man`‑Seite ist ein Kapitel, jeder `/EXAMPLES`‑Treffer eine Randnotiz aus den Annalen der System­kunst.

### Was macht es?

- `man` – ausführliche Handbücher (Abschnitte 1‑8).
- `help` – Shell‑Builtins.
- `whatis`/`apropos` – 1‑Zeilen‑ oder Schlagwort‑Suche.

### Cheat‑Sheet

```bash
man 7 regex          # Theorie‑Abschnitt
help alias           # Bash‑Builtin‑Doku
whatis ssh           # Kurzbeschreibung
apropos firewall     # alles Relevante
```

### Hands‑on‑Mission 📖

Öffne `man find`, tippe `/EXAMPLES`, blättere durch Beispiele (Taste `n`).

### Holmesian Insight

> Während du in *man* bist: `g` springt zum Anfang, `G` ans Ende – wie in *less*.

### Quizfrage

Befehl für 1‑Zeilen‑Kurzbeschreibung? → ``

---

## Kapitel 14 – `alias`

### Szene 🍷

*Diogenes‑Club, 11:00 Uhr.* Dicke Teppiche schlucken jeden Schritt. Zigarrenrauch hängt wie ein statisches Wolkenfragment unter Stuckrosetten. Mycroft Holmes liest die Times, ohne die Augen zu heben. Sherlock flüstert: „Zeit ist die größte Währung. Wir prägen uns eigene Münzen.“  
Am kleinen Reise‑Teleprinter definierst du elegante Kürzel – `alias ll="ls -lah --color"` – digitale Shorthand‑Sonette, die die Bourne‑Again‑Shell rezitieren wird.

### Was macht der Befehl?

`alias` **erstellt Abkürzungen** – z.&nbsp;B. `alias ll="ls -lah"`.  
In `~/.bashrc` speichern, dann mit `source ~/.bashrc` laden.


### Warum wichtig?

- **Effizienz** – lange Kommandos abkürzen.
- **Sicherheit** – `alias rm='rm -i'`.

### Cheat‑Sheet

```bash
alias ll="ls -lah --color"
unalias ll
alias              # alle listen
source ~/.bashrc   # neu laden
```

### Hands‑on‑Mission ⚙️

Schreibe `alias gs="git status"` in `~/.bashrc` und lade sie (`source ~/.bashrc`). Führe `gs` aus.

### Holmesian Insight

> Für komplexe Abläufe nutze Shell‑Funktionen: `deploy() { cp -r src dest; }`

### Quizfrage

Befehl, um Shell‑Startscript neu zu laden? → ``

---

## Kapitel 15 – `exit`

### Szene 🌅

*Tower Bridge, 12:05 Uhr.* Die erste Wintersonne sticht durch Wolken. Colonel Moriarty, gefesselt, wird zum Polizeiwagen geführt. Dampfschiffe tuten, Möwen kreischen. Holmes klappt sein Notizbuch zu, streift sich Handschuhe über: „Der Fall ist gelöst. Nur noch das Terminal schlafenlegen.“  
Das letzte Kommando `exit 0` blinkt wie das Schluss‑Bild eines Nickelodeon‑Films. Röhren verlöschen, Relais klicken ab – und der Ubuntu‑Mainframe fällt in wohlverdiente Dunkelheit.

### Was macht der Befehl?

`exit` **schließt die aktuelle Shell** oder beendet ein Skript.  
Exit‑Code 0 = alles okay, anderes = Fehler.

### Warum wichtig?

- **SSH‑Sessions** sauber schließen.
- **Skriptsteuerung** – Exit‑Codes für Fehler.

### Cheat‑Sheet

```bash
exit 0     # Erfolg
exit 1     # Fehler
logout     # Login‑Shells
Ctrl-D     # EOF
```

### Hands‑on‑Mission 🏁

Beende deine Shell via `exit 0`. Öffne neues Terminal, prüfe letzten Exit‑Code mit `echo $?` (sollte 0 sein).

### Holmesian Insight

> `$?` enthält Exit‑Code des letzten Befehls – unverzichtbar für Error Handling.

### Quizfrage

Welcher Exit‑Code bedeutet „Erfolg“? → ``

---

