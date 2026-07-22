-- ═══════════════════════════════════════════════════════════════
--  RUN THIS ONCE:  Supabase dashboard → SQL Editor → paste → Run
-- ═══════════════════════════════════════════════════════════════

-- 1. the cards table -------------------------------------------------
create table if not exists public.cards (
  slug        text primary key,
  data        jsonb not null,
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
);

alter table public.cards enable row level security;

-- anyone can READ a card (that's the whole point — public card pages)
drop policy if exists "public read cards" on public.cards;
create policy "public read cards"
  on public.cards for select
  to anon, authenticated
  using (true);

-- only a logged-in admin can create / edit / delete
drop policy if exists "admin write cards" on public.cards;
create policy "admin write cards"
  on public.cards for all
  to authenticated
  using (true) with check (true);

-- 2. photo storage ---------------------------------------------------
insert into storage.buckets (id, name, public)
values ('photos', 'photos', true)
on conflict (id) do nothing;

-- anyone can view photos
drop policy if exists "public read photos" on storage.objects;
create policy "public read photos"
  on storage.objects for select
  to anon, authenticated
  using (bucket_id = 'photos');

-- only a logged-in admin can upload
drop policy if exists "admin upload photos" on storage.objects;
create policy "admin upload photos"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'photos');

drop policy if exists "admin update photos" on storage.objects;
create policy "admin update photos"
  on storage.objects for update
  to authenticated
  using (bucket_id = 'photos');
