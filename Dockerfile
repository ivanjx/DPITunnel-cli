FROM alpine:latest AS build

RUN apk update && \
    apk add build-base cmake openssl openssl-dev openssl-libs-static linux-headers

COPY . .
RUN cmake -B./build -DCMAKE_BUILD_TYPE=RELEASE -DSTATIC_BINARY=true . && \
    make -C ./build -j $(nproc)

FROM alpine:latest
COPY --from=build /build .
