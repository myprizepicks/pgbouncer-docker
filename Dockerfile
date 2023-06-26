# docker build -t pgbouncer-docker:custom .

# This image is made to work with the related Helm chart. It lacks config files on purpose.

# Build stage
FROM alpine:3.17 as build

# Install build dependencies
RUN apk add -U --no-cache \
    autoconf \
    automake \
    libtool \
    pandoc \
    udns \
    udns-dev \
    curl \
    gcc \
    libc-dev \
    libevent \
    libevent-dev \
    make \
    openssl-dev \
    pkgconfig \
    postgresql-client

# Copy local pgbouncer directory
COPY pgbouncer /tmp/pgbouncer

# Compile
WORKDIR /tmp/pgbouncer
RUN ./autogen.sh
RUN ./configure --prefix=/usr --with-udns
RUN make
RUN make install

# Runtime stage
FROM alpine:3.17

# Install runtime dependencies
RUN apk add -U --no-cache busybox udns libevent postgresql-client

# Copy necessary files from build stage
COPY --from=build /usr/bin/pgbouncer /usr/bin/

# Setup directories
RUN mkdir -p /etc/pgbouncer /var/log/pgbouncer /var/run/pgbouncer && chown -R postgres /var/run/pgbouncer /etc/pgbouncer

USER postgres
EXPOSE 5432
CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
