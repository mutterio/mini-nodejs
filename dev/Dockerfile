FROM mutterio/mini-base

ENV VERSION=v4.1.2

RUN apk update && \
  apk add make gcc g++ python paxctl curl openssl ca-certificates \
    libgcc libstdc++ && \
  curl -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz | tar -xz && \
  cd /node-${VERSION} && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  export CFLAGS="$CFLAGS -D__USE_MISC" && \
  ./configure --prefix=/usr && \
  make -j${NPROC} -C out mksnapshot && \
  paxctl -c -m out/Release/mksnapshot && \
  make -j${NPROC} && \
  make install && \
  paxctl -cm /usr/bin/node && \
  npm install -g npm && \
  cd / && \
  rm -rf \
    /node-${VERSION} \
    /var/cache/apk/* \
    /tmp/* \
    /root/.npm \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html
