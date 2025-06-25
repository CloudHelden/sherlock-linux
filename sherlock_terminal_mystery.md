# Sherlock Holmes – **The Case of the Purloined Packet** 🕵️‍♂️


London, Dezember 1895: Dichter Kohlerauch legt sich wie ein Leichentuch auf die Stadt. In den Katakomben des Innenministeriums wurde ein Band streng geheimer Telegramme gestohlen. Die Spur führt in einen experimentellen **Ubuntu‑Mainframe** – dampfbetrieben, zahnradsurrend, gespeist von Lochkarten und Elektronen­röhren.

Inspector Lestrade ist ratlos. **Sherlock Holmes** – Meister der Deduktion – und **du** – sein neuer Technik‑Conduktor – sollen den Täter entlarven. Jeder Linux‑Befehl wird zur Sprungmarke in diesem Labyrinth aus Kupfer­drähten und Null‑Byte‑Schlupfwinkeln.

> *„Mein lieber Freund, wer der Shell lauscht, hört die Wahrheit der Maschinen.“* – S. Holmes

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

### Beispiele aus dem Fall

```bash
$ pwd
/home/holmes/Investigation
$ ln -s /home/holmes/Investigation ~/Investigation_symlink
$ cd ~/Investigation_symlink && pwd      # zeigt Linkpfad
$ pwd -P                                 # zeigt echten Pfad
```

### Hands‑on‑Mission 🔍

Führe `pwd` und `pwd -P` im Verzeichnis `~/Investigation_symlink` aus. Notiere beide Ergebnisse: logisch vs. physisch.

### Holmesian Insight

> In *Bash* ist `$PWD` immer der logische Pfad. Für den physischen benutzt du `$(pwd -P)` in Skripten.

### Quizfrage

Welches Flag löst Symlinks? → ``

---

## Kapitel 2 – `ls`

### Szene 📂

*Innenministerium, Archiv‑Souterrain, 08:15 Uhr.* Eine gewundene gusseiserne Treppe führt hinab in dunstige Tiefe. Wasser tropft in Pfützen; die Luft schmeckt nach altem Papier und feuchtem Ziegel. Zahllose Aktenschränke, bis zur Decke gestapelt, ziehen sich in Korridore davon wie Regimenter. Gaslampen werfen flackernde Lichtkegel, die Schatten tanzen lassen.  
Ein nervöser Archivbeauftragter wischt sich den Schweiß von der Stirn: „Es fehlen Schubladen – aber welche?“  
Holmes gleitet mit Handschuhspitzen über Messingschilder, murmelt „inventarium totius“ – dann sieht er dich an. Das Terminal, auf einem improvisierten Pult aus Kisten, wartet. Deine Aufgabe: mit einem simplen `ls -la` Licht in das Schattenregister der Dateien zu bringen.

### Was macht der Befehl?

`ls` listet **Dateien und Unterordner**.  
* `-l`: Details (Größe, Datum, Rechte).  
* `-a`: auch versteckte Dateien (Dot‑Files) anzeigen.  
* `-h`: menschen­lesbare Größen zusammen mit `-l`.

### Warum wichtig?

- **Schnell­inventur** – Inhalt & versteckte Dateien sichtbar machen.
- **Rechte‑Check** – wer darf was lesen/schreiben.
- **Sortierte Listen** – mit `--sort` und `--group-directories-first`.

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
$ ls -la ~/Investigation | head
$ ls -lh --group-directories-first /var/spool/telegraphs
```

### Hands‑on‑Mission 🗂️

1. Führe `ls -l` in `~/Investigation` aus.
2. Notiere die Rechte (d rwx …) von `mysterious.bin`.
3. Führe `ls -lrt` – welcher Eintrag ist der jüngste?

### Holmesian Insight

> `ls -ld */` listet *nur* Verzeichnisse im aktuellen Ordner – praktisch für große Code‑Repos.

### Quizfrage

Flag für menschen­lesbare Größen? → ``

---

## Kapitel 3 – `cd`

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

## Kapitel 4 – `touch`

### Szene 🖋️

*Posthof am Themse‑Kai, 22:30 Uhr.* Nebelwellen rollen vom Fluss, Sirenen eines fernen Dampfschiffs heulen. Holmes kniet im Schein einer Bullaugen‑Laterne neben einem Abdruck im gemusterten Pflaster – eine Schuhsohle mit ungewöhnlichem Zickzack‑Profil.  
„Wir brauchen digitale Kreide, Watson. Einen Punkt, zu dem wir zurückkehren können.“  
Du öffnest das Terminal auf einem klapprigen A‑Speicher‑Laptop, dessen Ventilator gegen die feuchte Luft kämpft, und schlägst mit `touch footprint.txt` einen stillen Pfosten ins Dateisystem.

### Was macht der Befehl?

`touch` **legt eine Datei an** oder **aktualisiert deren Datum/Zeit**.  
* `-a`: nur Zugriffszeit anpassen.  
* `-m`: nur Änderungszeit anpassen.

### Warum wichtig?

- **Platzhalter** – leere Config‑Dateien im Repo。
- **Time‑Frogging** – Stempel ändern, um Build‑Trigger auszulösen.

### Cheat‑Sheet

```bash
touch FILE                  # neu oder Zeit aktualisieren
touch -a FILE               # nur Access‑Zeit
touch -m FILE               # nur Modify‑Zeit
touch -t YYYYMMDDhhmm.ss F  # manueller Stempel
```

### Beispiele aus dem Fall

```bash
$ touch ~/Investigation/footprint.txt
$ touch -a -t 189512120101 ~/Investigation/footprint.txt
```

### Hands‑on‑Mission 👣

Aktualisiere `footprint.txt` mit `touch -m`, dann erstelle Platzhalter `clue1` bis `clue3`.

### Holmesian Insight

> Build‑Systeme wie *make* nutzen Zeitstempel. Ein falscher Stempel kann komplette Re‑Compiles erzwingen – oder verhindern.

### Quizfrage

Flag für NUR Zugriffs‑Zeitstempel? → ``

---

## Kapitel 5 – `cat` & `less`

### Szene 📖

*Baker Street, Kaminzimmer, 00:45 Uhr.* Wind heult im Schornstein, wirbelt Funken aus dem Kamin, die kurz in der Luft tanzen. Auf dem Mahagoni‑Tisch liegen zwei Dokumente: eine zusammengefaltete Notiz, deren Ecken Teeflecken zieren, und ein rußgeschwärztes Logbuch, so schwer, dass die Tischplatte leise knackt.  
Holmes zündet eine Öllampe an, die Flamme spiegelt sich in den Facetten des Schliffkristall‑Decanters. „Beginnen wir mit dem Kleinen“, flüstert er. `cat note.txt` lässt die lakonische Botschaft aufblitzen – drei kryptische Zeilen, kaum mehr als ein Rätsel im Rätsel.  
Für das Logbuch aber brauchst du eine Lupe für Bits: `less`. Die Seiten des digitalen Folianten klappen virtuell auf, und das Rauschen vergangener Prozesse füllt den Raum wie leises Gemurmel in einer Bibliothek.

### Was machen die Befehle?

#### Was macht `cat`?
Zeigt den kompletten Datei­inhalt sofort im Terminal – gut für kurze Dateien.

#### Was macht `less`?
Öffnet eine Datei **seitenweise**: scrollen mit Pfeilen, suchen mit `/Text`, beenden mit `q` – ideal für lange Logs.

### Warum wichtig?

- Schnellprüfung kleiner Dateien.
- Komfortables Blättern durch lange Logs.
- Kombination mit Pipes (`|`) für Previews.

### Cheat‑Sheet

| Taste in `less`  | Aktion                        |
| ---------------- | ----------------------------- |
| `Space` / `PgDn` | eine Seite vor                |
| `b` / `PgUp`     | zurück                        |
| `/muster`        | vorwärts suchen               |
| `n` / `N`        | nächster / vorheriger Treffer |
| `q`              | beenden                       |

### Beispiele aus dem Fall

```bash
$ cat ~/Investigation/note.txt
$ less +/Suspicious ~/Investigation/server.log   # direkt zur Fundstelle
```

### Hands‑on‑Mission 📜

Öffne `server.log` mit `less` und filtere (`&Error`) alle Zeilen, die „Error“ enthalten.

### Holmesian Insight

> `cat file | less` ist ineffizient – nutze direkt `less file`. Pipes sind nur nötig, wenn du stdout weiterreichen willst.

### Quizfrage

Taste zum Schließen von `less`? → ``

---

## Kapitel 6 – `cp`

### Szene 📦

*Bahndepot King’s Cross, 02:05 Uhr.* Dampflokomotiven zischen, Funken stieben an gusseisernen Bögen empor. Zwischen riesigen Holzcontainers steht eine einzelne Kiste mit dem blassen Stempel *Dossier 42*. Eine Bahnhofsuhr tickt – jede Sekunde ein Hammerschlag.  
Holmes hebt das Siegel und nickt: „Original für Scotland Yard, Kopie für uns – mit allen Metadaten, versteht sich.“  
Du baust das Terminal auf einem Eisenbahn‑Gepäckwagen auf; das Stahlrad darunter quietscht. Mit `cp -a -v` versiegelst du den perfekten Zwilling, inkl. Rechte, Zeitstempel, Symbol­links – nichts entgeht der Archivoption `-a`.

### Was macht der Befehl?

`cp` **kopiert Dateien oder Ordner**.  
* `-r`: Ordner samt Inhalt.  
* `-a`: alles mitnehmen (Rechte, Datum).  
* `-i`: vor Überschreiben fragen.

### Warum wichtig?

- **Backups** – Arbeitskopien, bevor du editierst.
- **Staging** – Files von Stage→Prod.

### Cheat‑Sheet

```bash
cp file     dest
cp -i       # nachfragen
cp -r dir   dest
cp -v       # verbose
cp -a       # archiviert (behält Rechte, Zeiten, Links)
```

### Beispiele aus dem Fall

```bash
$ cp -a -v ~/Investigation/dossier ~/Archive/Case42/
```

### Hands‑on‑Mission 📄

Kopiere `dossier` rekursiv nach `~/Archive/Case42`, behalte Rechte & Zeiten (`-a`).

### Holmesian Insight

> `rsync -a` ist moderner und schneller für viele Dateien, behält aber dieselben Attribute – beachte für große Backups.

### Quizfrage

Flag zum Beibehalten aller Attribute? → ``

---

## Kapitel 7 – `mv`

### Szene 📑

*Themse‑Promenade, 02:17 Uhr.* Nebelschwaden fegen über schwankende Gaslampen. Holmes entrollt `secret.txt`; das Papier raschelt wie Schwingen einer Nachteule. „Ein derart plakativer Name schreit nach Misstrauen.“  
Er schiebt die Datei in einen Umschlag mit Emblem eines unscheinbaren Regenschirm‑Herstellers. Dein Befehl `mv -b secret.txt umbrella_letter.txt` ist das digitale Pendant: ein lautloser Identitäts­wechsel, mit automatisch gesichertem Zwilling (`-b`) – für den Fall, dass Scotland Yard Beweiskette fordert.

### Was macht der Befehl?

`mv` **verschiebt oder benennt** Dateien und Ordner.  
* `-i`: fragt vor Überschreiben.  
* `-b`: legt Sicherheitskopie (`~`) an.  
* `-n`: überschreibt nie.

### Warum wichtig?

- **Umstrukturieren** – Projekte neu ordnen.
- **Tarnung** – sensible Dateien umbenennen.

### Cheat‑Sheet

```bash
mv old   new         # rename
mv file  dir/        # move
mv -i    ...         # interactive prompt
mv -b    ...         # Backup (~)
```

### Beispiele aus dem Fall

```bash
$ mv -b ~/Investigation/secret.txt umbrella_letter.txt
```

### Hands‑on‑Mission 🎩

`mv -i ~/Investigation/footprint.txt ~/Beweisarchiv/evidence.dat` (mit Rückfrage).

### Holmesian Insight

> Datei versehentlich überschrieben? Das `~`‑Backup von `mv -b` rettet den alten Inhalt.

### Quizfrage

Flag für automatisches Backup? → ``

---

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

