# ベースイメージとして公式のJekyllイメージを使用
FROM jekyll/jekyll:latest

# 作業ディレクトリを設定
WORKDIR /srv/jekyll

# ホストの現在のディレクトリの内容をコンテナにコピー
RUN mkdir docs && chmod -R 777 docs

# /srv/jekyll/docsディレクトリへの書き込み権限を付与
# RUN chmod -R 777 /srv/jekyll/docs

COPY Gemfile docs/
# COPY _config.yml docs/

WORKDIR /srv/jekyll/docs

# RUN bundle config set --local path 'vendor/bundle'
RUN bundle install

# サイトをビルド
RUN jekyll build

