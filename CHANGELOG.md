# Changelog

Each entry is one version of this template. Breaking changes come first.

## 2.2.46-1 (2026-11-16)

- README: Deploy on Railway button for the published template `nocobase-1`. No change to the app or its configuration.

## 2.2.46 (2026-11-16)

- First release: NocoBase 2.2.46 (`nocobase/nocobase:2.2.46@sha256:26d7caf261956ee34c9ce3066372bf189a0a8739e946cc9164bad556d7f4f9fd`) with Railway Postgres.
- The admin password is generated per deploy (`INIT_ROOT_PASSWORD`); the start script refuses the upstream default `admin123`.
- `/app/nocobase/storage` (uploads, plugins, logs) lives on a Railway volume.
