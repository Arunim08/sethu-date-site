create table if not exists public.date_responses (
  id uuid primary key default gen_random_uuid(),
  date_ideas text[] not null check (cardinality(date_ideas) between 1 and 2),
  selected_date date not null,
  selected_time text not null,
  note text check (char_length(coalesce(note, '')) <= 1000),
  no_taps integer not null default 0 check (no_taps between 0 and 1000),
  submitted_at timestamptz not null default now()
);

alter table public.date_responses enable row level security;

revoke all on public.date_responses from anon, authenticated;
grant insert on public.date_responses to anon;

drop policy if exists date_responses_anon_insert on public.date_responses;
create policy date_responses_anon_insert
  on public.date_responses
  for insert
  to anon
  with check (true);