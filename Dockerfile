# NocoBase for Railway: the official image, pinned by version and digest.
# Upstream: https://github.com/nocobase/nocobase (docker/nocobase)
FROM nocobase/nocobase:2.2.46@sha256:26d7caf261956ee34c9ce3066372bf189a0a8739e946cc9164bad556d7f4f9fd

# Fixed settings. Railway variables override them.
ENV DB_DIALECT=postgres \
    TZ=UTC \
    INIT_LANG=en-US \
    INIT_ROOT_NICKNAME="Super Admin" \
    INIT_ROOT_USERNAME=nocobase

COPY railway-start.sh /app/railway-start.sh
RUN chmod +x /app/railway-start.sh

# The image's nginx serves the UI and proxies the API on port 80.
EXPOSE 80
CMD ["/app/railway-start.sh"]
