-- StockWise: one private JSON document per authenticated shop account.
-- Run this in the Supabase SQL Editor for the new project.
create table if not exists public.stockwise_shop_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.stockwise_shop_data enable row level security;

create policy "Shop owners can read their own data"
  on public.stockwise_shop_data for select
  to authenticated
  using ((select auth.uid()) = user_id);

create policy "Shop owners can create their own data"
  on public.stockwise_shop_data for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

create policy "Shop owners can update their own data"
  on public.stockwise_shop_data for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

grant select, insert, update on public.stockwise_shop_data to authenticated;
