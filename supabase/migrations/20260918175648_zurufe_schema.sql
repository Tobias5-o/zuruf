-- Zuruf: Tabelle "zurufe" + private Dateiablage "belege"
-- Fachliche Beschreibung der Felder: tools/zuruf/plan.md, Abschnitt 3.

create table if not exists public.zurufe (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  text text,
  titel text,
  art text not null check (art in (
    'aufgabe','notiz','kundennotiz','beleg','idee',
    'projektdoku','team_hinweis','social_media','inspiration','auftrag'
  )),
  zielhinweis text,
  faellig_am date,
  status text not null default 'offen' check (status in ('offen','erledigt')),
  quelle text not null check (quelle in ('sprechen','foto','serie','video','tippen')),
  medien text[] not null default '{}',
  ergebnis text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.zurufe is 'Eintraege aus der Zuruf-App. Siehe tools/zuruf/plan.md Abschnitt 3.';

create index if not exists zurufe_user_id_idx on public.zurufe (user_id);
create index if not exists zurufe_status_idx on public.zurufe (status);
create index if not exists zurufe_faellig_am_idx on public.zurufe (faellig_am);

-- updated_at automatisch pflegen
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists zurufe_set_updated_at on public.zurufe;
create trigger zurufe_set_updated_at
  before update on public.zurufe
  for each row execute function public.set_updated_at();

-- Row Level Security: jede Person sieht und aendert nur die eigenen Eintraege
alter table public.zurufe enable row level security;

create policy "Eigene Eintraege lesen" on public.zurufe
  for select using (auth.uid() = user_id);

create policy "Eigene Eintraege anlegen" on public.zurufe
  for insert with check (auth.uid() = user_id);

create policy "Eigene Eintraege aendern" on public.zurufe
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Eigene Eintraege loeschen" on public.zurufe
  for delete using (auth.uid() = user_id);

-- Private Dateiablage fuer Fotos/Videos/Belege (nicht oeffentlich lesbar)
insert into storage.buckets (id, name, public)
values ('belege', 'belege', false)
on conflict (id) do nothing;

create policy "Eigene Dateien lesen" on storage.objects
  for select using (
    bucket_id = 'belege' and auth.uid()::text = (storage.foldername(name))[1]
  );

create policy "Eigene Dateien hochladen" on storage.objects
  for insert with check (
    bucket_id = 'belege' and auth.uid()::text = (storage.foldername(name))[1]
  );

create policy "Eigene Dateien aendern" on storage.objects
  for update using (
    bucket_id = 'belege' and auth.uid()::text = (storage.foldername(name))[1]
  );

create policy "Eigene Dateien loeschen" on storage.objects
  for delete using (
    bucket_id = 'belege' and auth.uid()::text = (storage.foldername(name))[1]
  );
