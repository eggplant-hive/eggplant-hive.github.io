# ベースイメージとして公式のJekyllイメージを使用
FROM jekyll/jekyll:latest

# 作業ディレクトリを設定
WORKDIR /srv/jekyll/docs

RUN chown -R jekyll:jekyll /srv/jekyll

RUN gem install github-pages kramdown-parser-gfm rouge webrick

# サイトをビルド
RUN jekyll build




