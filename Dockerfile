FROM jruby:9.1.13.0

RUN apt-get update -qq && apt-get install -y build-essential apt-transport-https apt-utils
RUN apt-get install -y libxml2-dev libxslt1-dev curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

RUN yarn config set registry 'https://registry.npm.taobao.org'
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org