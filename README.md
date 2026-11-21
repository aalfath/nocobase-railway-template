[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/nocobase-1?utm_medium=integration&utm_source=button&utm_campaign=nocobase)

# NocoBase on Railway

This repo is the source of the **NocoBase** template on Railway. It deploys [NocoBase](https://www.nocobase.com/) **2.2.49**, an open-source no-code and low-code platform for building internal tools, CRMs and business apps on top of a database.

## What the template deploys

| Service | Source | Notes |
|---|---|---|
| `NocoBase` | this repo (`Dockerfile`) | `nocobase/nocobase:2.2.49` pinned by digest, with a small start script. Public domain on port 80 (the image's nginx), health check `/api/__health_check`, volume on `/app/nocobase/storage` (uploads, plugins, logs) |
| `Postgres` | Railway Postgres | NocoBase's database, private network only |

## Variables

| Variable | Default | Notes |
|---|---|---|
| `APP_KEY` | `${{secret(48)}}` | Signs sessions and tokens. Generated per deploy; don't change it later |
| `INIT_ROOT_EMAIL` | `admin@nocobase.com` | Email of the first admin, used at first start only |
| `INIT_ROOT_PASSWORD` | `${{secret(24)}}` | Password of the first admin, generated per deploy. Read it in the service's Variables tab. The start script refuses the upstream default `admin123` |
| `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USER`, `DB_PASSWORD` | references to `Postgres` | Private network connection |
| `PORT` | `80` | The port Railway's health check and domain use |

Fixed settings (`DB_DIALECT=postgres`, `TZ=UTC`, `INIT_LANG=en-US`, root nickname and username) are baked into the `Dockerfile` as `ENV`, so you can override any of them with a Railway variable.

After the first start, sign in with `INIT_ROOT_EMAIL` and `INIT_ROOT_PASSWORD`, then change the email and password in your profile. Changing the two variables later has no effect.

## Updates

The template builds from this repo's `main` branch. When a new NocoBase version is tested here, the pin in the `Dockerfile` is bumped and `CHANGELOG.md` gets an entry. Railway then shows an "update available" notice on your project and you choose when to apply it. NocoBase runs its database migrations on start, so back up the Postgres volume before you apply an update.

## Local test

`docker compose up --build` runs the same setup with a local Postgres (test passwords only, see `docker-compose.yml`). Open the port that Compose maps to container port 80.
