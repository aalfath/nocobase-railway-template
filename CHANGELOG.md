# Changelog

Each entry is one version of this template. Breaking changes come first.

## 2.2.49 (2026-11-21)

- No breaking changes. Apps, data and settings in Postgres and uploads on the `/app/nocobase/storage` volume are kept; NocoBase runs its own upgrade at start.
- NocoBase [2.2.47](https://github.com/nocobase/nocobase/releases/tag/v2.2.47), [2.2.48](https://github.com/nocobase/nocobase/releases/tag/v2.2.48) and [2.2.49](https://github.com/nocobase/nocobase/releases/tag/v2.2.49): permission fixes (public forms accept submissions only for their configured collection; UI templates and legacy block templates need the right permission to change), the bundled Nginx is 1.30.7, and bug fixes in workflows, backups and data sources.
- Image: `nocobase/nocobase:2.2.49@sha256:b620b1558ba5ac11f092dbc50bb8855d6c75e18829f28243f7a42e8081d502e2`.

## 2.2.46-1 (2026-11-16)

- README: Deploy on Railway button for the published template `nocobase-1`. No change to the app or its configuration.

## 2.2.46 (2026-11-16)

- First release: NocoBase 2.2.46 (`nocobase/nocobase:2.2.46@sha256:26d7caf261956ee34c9ce3066372bf189a0a8739e946cc9164bad556d7f4f9fd`) with Railway Postgres.
- The admin password is generated per deploy (`INIT_ROOT_PASSWORD`); the start script refuses the upstream default `admin123`.
- `/app/nocobase/storage` (uploads, plugins, logs) lives on a Railway volume.
