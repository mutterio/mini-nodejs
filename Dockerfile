FROM mutterio/mini-base
ARG VERSION=5.1.1
RUN \
  echo "building for $VERSION" && \
  apk add --update curl make gcc g++ python linux-headers paxctl \
    libgcc libstdc++ krb5-dev && \
  curl -sSL https://nodejs.org/dist/v${VERSION}/node-v${VERSION}.tar.gz | tar -xz && \
  cd /node-v${VERSION} && \
  ./configure --prefix=/usr ${CONFIG_FLAGS} && \
  make -j$(($(grep -c ^processor /proc/cpuinfo)+1)) && \
  make install && \
  paxctl -cm /usr/bin/node && \
  cd / && \
  if [ -x /usr/bin/npm ]; then \
    npm install -g npm && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
  fi && \
  rm -rf \
    /etc/ssl \
    /node-v${VERSION} \
    ${RM_DIRS} \
    /usr/share/man \
    /tmp/* \
    /var/cache/apk/* \
    /root/.npm \
    /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html
