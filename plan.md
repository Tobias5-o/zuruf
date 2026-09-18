# Plan für „Zuruf"

Letzte Aktualisierung: 2026-09-18 (Version 2 — mit ausführlichen Alltagsfällen)

> Dieser Plan beschreibt, was die App tun soll — noch kein Code, keine Funktion.
> In Alltagssprache geschrieben. Fachwörter stehen in Klammern erklärt.

---

## 1. Was die App kann, in fünf Sätzen

Zuruf ist dein Eingang in der Hosentasche: Unterwegs sprichst, tippst, fotografierst oder
filmst du kurz etwas — einen Gedanken, eine Aufgabe, eine Kundennotiz, einen Beleg, ein
Projektfoto, einen Hinweis fürs Team, Rohmaterial für Social Media, eine Inspiration oder
sogar einen direkten Auftrag an einen deiner digitalen Mitarbeiter. Ein KI-Modell (ein
Sprachmodell, das Text versteht und Vorschläge macht) liest das, hört deine begleitende
Sprachansage mit und schlägt dir Titel, Art und — je nach Art — auch schon das Ziel vor
(z. B. welches Projekt, welcher Team-Kanal, Kalender oder Trello). Du bestätigst den
Vorschlag mit einem Klick — oder änderst ihn erst. Danach landet der Eintrag in deiner
Datenbank (einem Online-Speicher, den du und später dein Agent auslesen können) und
erscheint sofort auch am Rechner in derselben Liste. Ein „Auftrag" ist die einzige
Ausnahme: der löst sofort etwas aus, statt nur abgelegt zu werden — alles andere liest ein
späterer Agent regelmäßig aus und erledigt, was zum Eintrag passt.

## 2. Die Knöpfe und Ansichten

**Was du siehst, wenn du die App öffnest:**
Oben eine Ansicht namens „Heute" — eine kurze Liste mit den Einträgen, die heute fällig
sind oder heute erfasst wurden. Darunter vier große, mit dem Daumen erreichbare Knöpfe:

- **FOTO** (oberster, größter Knopf — dein häufigster Fall). Antippen öffnet zuerst die
  Wahl „ein Bild" oder „mehrere (Serie)" — für Fotoserien, die später z. B. zu
  Social-Media-Bildern werden.
- **VIDEO** (eigener Knopf, getrennt von Foto — für Clips, aus denen später z. B. ein
  Reel wird)
- **SPRECHEN** (Mikrofon antippen, reden, fertig)
- **TIPPEN** (kurzes Textfeld für den Moment, in dem Sprechen unpassend ist)

**Die wichtigste Regel bei Foto/Video/Serie:** Du sprichst praktisch immer eine kurze
Ansage dazu — worum es geht, für welches Projekt, welchen Kanal oder welchen Anlass. Das
Modell nutzt diese Ansage, um Art *und* Ziel vorzuschlagen (z. B. „das ist für
Hacienda" → Projektordner Hacienda; „an die Team-WhatsApp" → Kanal WhatsApp). Ohne Ansage
schlägt das Modell nur anhand des Bildes selbst vor, so gut es kann.

**Was passiert, wenn du SPRECHEN drückst:**
Die App nimmt auf, solange du sprichst. Nach dem Loslassen wird deine Sprache in Text
umgewandelt (Spracherkennung) und dieser Text an das KI-Modell geschickt. Nach ein paar
Sekunden erscheint eine Karte mit dem Vorschlag des Modells (siehe unten). Du bestätigst,
änderst oder verwirfst sie.

**Die Vorschlags-Karte** (erscheint nach Sprechen, Foto, Video oder Tippen):
Zeigt den erkannten Text, darunter Titel, eine der zehn Arten (siehe Abschnitt 3) als
Auswahl-Chips, ein vorgeschlagenes Ziel (falls zutreffend, z. B. „Kalender" oder
„Trello", „Projekt Hacienda", „Kanal WhatsApp") und — falls erkannt — ein
Fälligkeitsdatum. Zwei Knöpfe: „Speichern" und „Verwerfen". Alles auf der Karte bleibt
antippbar, du kannst also vor dem Speichern noch alles korrigieren.

**Wie die Liste aussieht:**
Untereinander eine Reihe von Karten, jede mit: Titel, kleines Symbol für die Art,
Fälligkeitsdatum (falls vorhanden), Status (offen/erledigt) und bei Fotos/Videos ein
Vorschaubild. Ganz oben „Heute", darunter die restlichen Einträge nach Datum sortiert,
neueste zuerst. Ein Filter oben in der Liste lässt dich nach Art einschränken (z. B. nur
„Beleg" anzeigen).

**Weitere Bildschirme:** Ein Anmelde-Bildschirm (damit nur du deine Einträge siehst) und
eine Einstellungen-Seite (z. B. später: Sprache der Spracherkennung, Konto abmelden).

## 3. Was gespeichert wird

Jeder Eintrag ist eine Zeile mit diesen Feldern:

| Feld | Was drinsteht |
|---|---|
| **Text** | Der rohe erkannte Text (aus Sprache, Tippen oder Bildunterschrift/Begleit-Ansage) |
| **Titel** | Kurzer Titel, vom Modell vorgeschlagen oder von dir eingegeben |
| **Art** | Eine der zehn Arten (Tabelle unten) |
| **Zielhinweis** | Wohin es gehen soll, aus deiner Ansage abgeleitet (z. B. Projektname, Team-Kanal, „Kalender" oder „Trello") — kann leer sein |
| **Fälligkeit** | Datum, falls erkannt oder von dir gesetzt (kann leer sein) |
| **Status** | offen / erledigt |
| **Quelle** | Wie der Eintrag entstand: Sprechen, Foto, Serie, Video oder Tippen |
| **Medien** | Bild- oder Videodatei(en), falls über Foto/Serie/Video erfasst (sonst leer) |
| **Ergebnis** | Leer, bis dein Agent später etwas getan hat — dann trägt er hier ein, was er erledigt hat |

**Wichtig:** Nur du siehst deine eigenen Einträge. Niemand sonst hat Zugriff.

### Die zehn Arten und ihr Ziel

| Art | Ziel später | Wie das Ziel bestimmt wird |
|---|---|---|
| **Aufgabe** | Klein/spontan → Google-Kalender; großer Projekt-Task → Trello | Modell schätzt anhand des Inhalts, du bestätigst/schaltest um |
| **Notiz** | Repository (`Wissen/`) | automatisch nach Art |
| **Kundennotiz** | passendem Kunde/Projekt zugeordnet | Modellvorschlag, du bestätigst |
| **Beleg** | Belege-Skill (Buchhaltung) | automatisch nach Art |
| **Idee** | Ideenspeicher | automatisch nach Art |
| **Projektdoku** | passender Projekt-/Bereichs-Ordner im Workspace | du sagst das Projekt in der Sprachansage dazu |
| **Team-Hinweis** | Telegram **oder** WhatsApp (schnelle Info) **und** Ablage auf Google Drive (dauerhaft) | du sagst den Kanal in der Sprachansage dazu |
| **Social-Media-Rohmaterial** | Video-Clip → Reel; Fotoserie → Social-Media-Bilder; weiterverarbeitet vom `content-production`-Skill | du sagst Thema/Anlass in der Sprachansage dazu |
| **Inspiration** | zunächst `Eingang/`, nach deiner Sichtung dauerhaft nach `Wissen/extern/` (Marktimpulse, Wettbewerberbeobachtung, Inspiration — passend zur bestehenden Regel in `WORKSPACE.md`) | du sagst Kontext dazu (welche Firma/welcher Bereich oder privat, worum es geht) |
| **Auftrag** | löst sofort ein digitales System/einen Agenten aus (Ziel-System noch offen — siehe „Offene Fragen") | direkter Befehl, kein Ziel-Rätselraten nötig |

## 4. Was das Modell tut — und was nicht

Das Modell **schlägt nur vor**, es entscheidet nie endgültig. Titel, Art, Zielhinweis und
Fälligkeit sind Vorschläge, die du auf der Karte bestätigst, korrigierst oder verwirfst,
bevor irgendetwas gespeichert wird — das gilt auch für „Auftrag"-Einträge: der Auftrag
wird erst nach deiner Bestätigung ausgelöst, nicht vorher. Antwortet das Modell nicht
(z. B. weil kein Internet da ist oder ein Fehler auftritt), wird der Eintrag trotzdem
gespeichert — nur eben ohne Vorschlag, mit leerem Titel/Art/Fälligkeit, damit unterwegs
nichts verloren geht. Du kannst ihn später am Rechner nachtragen.

**Technischer Hinweis dazu:** Das Modell ist OpenAI (GPT). Der Zugangsschlüssel darf aus
Sicherheitsgründen nicht direkt im Browser stehen (sonst könnte ihn jeder auslesen und
missbrauchen). Deshalb läuft der Aufruf über eine kleine Zwischenstation (eine sogenannte
Supabase Edge Function — ein winziges Programm, das im Hintergrund läuft, den Schlüssel
sicher verwahrt und die Anfrage an OpenAI weiterreicht). Die App selbst redet nur mit
dieser Zwischenstation, nie direkt mit OpenAI.

## 5. Was dein Agent später damit macht

Ein separater Agent liest regelmäßig die Datenbank und behandelt jeden offenen Eintrag
passend zu seiner Art (siehe Tabelle in Abschnitt 3) — mit einer Ausnahme:

- **Auftrag**-Einträge warten nicht auf den nächsten regelmäßigen Durchlauf, sondern
  sollen sofort ein System benachrichtigen, sobald du sie bestätigst. Welches System das
  genau ist, ist noch offen (siehe unten) — das klären wir, bevor wir diesen Teil bauen.

Nachdem der Agent etwas getan hat, schreibt er ins Feld **Ergebnis**, was genau er
gemacht hat (z. B. „als Trello-Karte ‚Angebot nachfassen' angelegt" oder „per WhatsApp an
Hacienda-Team-Kanal geschickt"). Alles, was löscht, etwas Bestehendes überschreibt, eine
Nachricht nach außen schickt (Telegram/WhatsApp) oder einen Auftrag ausführt, fragt der
Agent vorher nach — das entspricht der Grundregel aus `WORKSPACE.md`, dass bei riskanten
oder nach außen wirkenden Änderungen erst das Vorgehen vorgeschlagen und eine Freigabe
abgewartet wird.

## Offene Fragen (bewusst nicht geraten)

- **Ziel-System für „Auftrag":** Welches System/welcher digitale Mitarbeiter soll sofort
  benachrichtigt werden? Klären wir, bevor wir diesen Teil bauen.
- **Google-Drive-Ablage für Team-Hinweise:** Genaue Ordnerstruktur (pro Firma? pro
  Projekt?) noch offen.
- **content-production-Übergabe:** Wie genau ein Social-Media-Rohmaterial-Eintrag an den
  bestehenden `content-production`-Skill übergeben wird, klären wir beim Bauen des
  Agenten.

---

**Status:** Entwurf Version 2 — wartet auf dein Feedback. Sag mir, was anders sein soll,
dann passe ich den Plan an, bis er passt.
