FROM rust:1-alpine

RUN apk add --no-cache musl-dev && \
    cargo install dummyhttp

ENTRYPOINT ["dummyhttp"]
CMD ["-v"]
