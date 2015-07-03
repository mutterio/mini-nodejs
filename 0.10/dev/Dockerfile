FROM mutterio/mini-base

ENV VERSION=v0.10.39 CMD=node DOMAIN=nodejs.org

RUN apk update && \
  apk add make gcc g++ python paxctl curl openssl ca-certificates \
    libgcc libstdc++ && \
  curl -sSL https://${DOMAIN}/dist/${VERSION}/${CMD}-${VERSION}.tar.gz | tar -xz && \
  cd /${CMD}-${VERSION} && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  export CFLAGS="$CFLAGS -D__USE_MISC" && \
  ./configure --prefix=/usr && \
  make -j${NPROC} -C out mksnapshot && \
  paxctl -c -m out/Release/mksnapshot && \
  make -j${NPROC} && \
  make install && \
  paxctl -cm /usr/bin/${CMD} && \
  npm install -g npm && \
  cd / && \
  rm -rf \
    /${CMD}-${VERSION} \
    /var/cache/apk/* \
    /tmp/* \
    /root/.npm \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html
