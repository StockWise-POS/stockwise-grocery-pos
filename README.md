# StockWise grocery billing and inventory

Live app: https://nishansalian.github.io/stockwise-grocery-pos/

StockWise uses Supabase Auth for shop sign-in and a private JSON row per shop. Row-level security restricts each account to its own shop data.

## Supabase setup

This repository is connected to the StockWise Supabase project. The browser configuration in `config.js` contains the project URL and publishable key. Publishable keys are intended for browser apps; never put a Supabase secret or service-role key in this repository.

The database table and policies are defined in `schema.sql`. The project was provisioned with the Data API enabled, automatic table exposure disabled, and automatic RLS enabled.

## Authentication

Set the Supabase Auth Site URL to:

`https://nishansalian.github.io/stockwise-grocery-pos/`

Add that URL (and its paths) to the project's allowed redirect URLs. Email confirmation can remain enabled; users will confirm their address before their first sign-in.

## Account model

Each shop owner creates one account and can sign in on multiple devices to sync that shop's data. This version does not provide multi-staff access to one shop, simultaneous edit conflict resolution, or server-side audit history. Review those needs before relying on it for live financial records.
