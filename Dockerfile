# NocoBase for Railway: the official image, pinned by version and digest.
# Upstream: https://github.com/nocobase/nocobase (docker/nocobase)
FROM nocobase/nocobase:2.2.49@sha256:b620b1558ba5ac11f092dbc50bb8855d6c75e18829f28243f7a42e8081d502e2

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
