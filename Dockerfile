FROM ubuntu:15.10

RUN apt-get update \
 && apt-get -y install build-essential git unzip ruby ruby-dev \
        libxml2-dev libxslt-dev libcurl4-openssl-dev pkg-config \
        build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev \
        libsqlite3-dev cmake libxml2 zlibc zlib1g-dev openssl \
        libreadline6 sqlite3 curl wget jq ca-certificates \
 && apt-get clean

# install bosh-init
RUN wget 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-linux-amd64' \
 && mv bosh-init-0.0.81-linux-amd64 /usr/local/bin/bosh-init \
 && chmod u+x /usr/local/bin/bosh-init

# install spiff
RUN wget 'https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip' \
 && unzip spiff_linux_amd64.zip \
 && mv spiff /usr/local/bin/spiff \
 && chmod u+x /usr/local/bin/spiff \
 && rm -f spiff_linux_amd64.zip

# install cf-cli
RUN wget -O cf-cli.tgz 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.15.0&source=github-rel' \
 && tar -xvzf cf-cli.tgz \
 && mv cf /usr/local/bin/cf \
 && chmod u+x /usr/local/bin/cf \
 && rm -f cf-cli.tgz

# install bosh-workspace
RUN gem install bundler --no-rdoc --no-ri
RUN gem install bosh_cli -v 1.3189.0 --no-rdoc --no-ri
RUN gem install bosh_cli_plugin_micro -v 1.3189.0 --no-rdoc --no-ri
RUN gem install bosh-workspace -v 0.9.10 --no-rdoc --no-ri
RUN gem install cf-uaac -v 3.1.6 --no-rdoc --no-ri
RUN gem install rake -v 10.5.0 --no-rdoc --no-ri
RUN gem install thor -v 0.19.1 --no-rdoc --no-ri
RUN gem install etcd -v 0.3.0 --no-rdoc --no-ri
RUN gem install mechanize -v 2.7.4 --no-rdoc --no-ri
