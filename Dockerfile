FROM alpine:latest AS build

RUN apk update && \
    apk add build-base cmake openssl openssl-dev openssl-libs-static linux-headers

COPY . .
RUN chmod +x build_static_alpine.sh && \
    ./build_static_alpine.sh

FROM alpine:latest
COPY --from=build /build .
