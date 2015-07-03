FROM mutterio/mini-base

ENV VERSION=v2.3.2 CMD=iojs DOMAIN=iojs.org
ENV CONFIG_FLAGS="--fully-static --without-npm" DEL_PKGS="libgcc libstdc++" RM_DIRS=/usr/include

RUN apk update && \
  apk add openssl linux-headers make gcc g++ python paxctl libgcc libstdc++ && \
  curl -sSL https://${DOMAIN}/dist/${VERSION}/${CMD}-${VERSION}.tar.gz | tar -xz && \
  cd /${CMD}-${VERSION} && \
  ./configure --prefix=/usr ${CONFIG_FLAGS} && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /usr/bin/${CMD} && \
  apk del linux-headers make gcc g++ python paxctl libgcc libstdc++  && \
  cd / && rm -rf \
    /${CMD}-${VERSION} \
    /var/cache/apk/* \
    /tmp/* \
    /root/.npm \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html
