FROM node:24-slim AS build

ARG APPLICATION_VERSION

RUN npm install -g jsonrepair@${APPLICATION_VERSION}

FROM gcr.io/distroless/nodejs24-debian12 AS release

LABEL maintainer="ToshY (github.com/ToshY)"

COPY --from=build /usr/local/bin/jsonrepair /usr/local/bin/jsonrepair
COPY --from=build /usr/local/lib/node_modules/jsonrepair/lib/esm /usr/local/lib/esm
COPY --from=build /usr/local/lib/node_modules/jsonrepair/package.json /usr/local/package.json

USER nonroot:nonroot

ENTRYPOINT ["/nodejs/bin/node", "/usr/local/bin/jsonrepair"]