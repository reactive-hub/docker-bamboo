FROM reactivehub/bamboo

ENV DOCKER_VERSION 1.3.3~dfsg1-2
ENV PACKER_VERSION 0.7.5
ENV PACKER_DOWNLOAD_URL https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
ENV SBT_VERSION 0.13.7
ENV NODEJS_VERSION 0.10.35-1nodesource1~jessie1
ENV FLEET_VERSION 0.9.0
ENV FLEET_DOWNLOAD_URL https://github.com/coreos/fleet/releases/download/v0.9.0/fleet-v0.9.0-linux-amd64.tar.gz

RUN set -x \
    && curl -sL https://deb.nodesource.com/setup | bash - \
    && echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends --force-yes \
      bzip2 \
      docker.io=$DOCKER_VERSION \
      sbt=$SBT_VERSION \
      nodejs \
    && rm -r /var/lib/apt/lists/* \
    && npm install gulpjs/gulp#4.0 -g \
    && curl -sSL $PACKER_DOWNLOAD_URL -o /tmp/packer.zip \
    && unzip /tmp/packer.zip -d /usr/bin \
    && rm /tmp/packer.zip \
    && curl -sSL $FLEET_DOWNLOAD_URL -o /tmp/fleet.tar.gz \
    && tar xzf /tmp/fleet.tar.gz -C /usr/bin fleet-v$FLEET_VERSION-linux-amd64/fleetctl --strip-components=1 \
    && rm /tmp/fleet.tar.gz

# Google Cloud SDK
RUN set -x \
    && apt-get -qq update \
    && apt-get install -qq --no-install-recommends python \
    && curl -sSL https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -xzf - -C /opt \
    && /opt/google-cloud-sdk/install.sh \
      --usage-reporting=false \
      --bash-completion=false \
      --path-update=false \
      --additional-components=preview \
    && /opt/google-cloud-sdk/bin/gcloud components update \
    && rm -r /var/lib/apt/lists/*

ENV PATH /opt/google-cloud-sdk/bin:$PATH

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
