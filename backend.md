# Backend: Zuruf

Stand: 2026-09-18

## Anbieter und Projekt

- Anbieter: **Supabase**
- Projektname: **Zuruf**
- Region: **Frankfurt (eu-central-1)**
- Tarif: Free
- Projekt-Ref: `odqgwuktgoxqkgrqpmys`
- Organisation: `gflkzenzuoajbnzmgxtd` (Five-O GmbH)

## Verbindung

- Ordner `tools/zuruf/` ist per Supabase-CLI (lokal installiert via npm, `npx supabase ...`) mit dem Projekt verknüpft (`supabase link`).
- Anmeldung läuft über einen persönlichen Supabase-Access-Token, den die CLI selbst außerhalb dieses Workspace speichert (nicht in einer Datei hier, nicht im Chat).
- Datenbank-Passwort liegt ausschließlich im Passwort-Manager von Tobias — nicht im Workspace.
- Lokale Konfigurationsdatei: `tools/zuruf/supabase/config.toml` (enthält nur die Projekt-Ref, keine Geheimnisse).

## Was ich (Agent) nie tun darf, ohne vorher zu fragen

- Projekt oder Tabellen **löschen**
- Bestehende Daten **überschreiben**
- Zugriffsregeln (Row Level Security, Policies) **lockern** oder deaktivieren
- Tarif/Pricing Plan **ändern**

## Was ich frei tun darf

- Tabellen anlegen, Schema ändern (additiv), Migrationen erstellen
- Row Level Security Policies setzen (verschärfen/einrichten)
- Daten lesen und abfragen
- Neue, klar abgegrenzte Funktionen (Functions), Trigger, Indizes anlegen

## Sicherheitseinstellungen bei Projekterstellung

- Data API: aktiviert
- Automatically expose new tables: deaktiviert (Zugriff pro Tabelle bewusst freigeben)
- Automatic RLS: aktiviert (neue Tabellen starten gesperrt, bis Regeln gesetzt sind)
