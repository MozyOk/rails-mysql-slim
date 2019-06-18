FROM ruby:2.6.3

# 9系nodeをインストール
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn

ENV APP_PATH /rails-mysql-slim

RUN mkdir $APP_PATH
WORKDIR $APP_PATH

ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install

# ローカルの作業ディレクトリ内容を全てコンテナ内にコピー
COPY . $APP_PATH
