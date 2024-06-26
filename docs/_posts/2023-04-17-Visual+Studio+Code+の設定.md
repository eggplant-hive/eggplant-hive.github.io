---
title: "Visual Studio Code の設定"
date: "2023-04-17"
---

![](https://assets.st-note.com/production/uploads/images/103237826/rectangle_large_type_2_05bab095330b53e1a093076de3ff12e0.png?width=800)

[https://note.com/ego_station/n/n6d71c3c4a0ca](https://note.com/ego_station/n/n6d71c3c4a0ca)

[前回の記事](https://note.com/ego_station/n/n6d71c3c4a0ca) (↑)に続いて、「Vue3」と 「Typescript」のコーディングスタイルをチェック出来るようにするために、Visual Studio Code にプラグインの追加と（最低限の）設定を行います。

## Visual Studio Code (以下、VS Code)とは

VS Code は、統合開発環境 (IDE) の一つで、プログラムの開発を支援してくれるアプリケーションです。VS Code の主な長所は以下の通りです。

###  1. 軽量で高速な動作

VS Code は、他の IDE と比較して非常に軽量であり、高速に動作します。また、エディタとしての基本的な機能を備えているため、プラグインなどを追加することで必要な機能を自由にカスタマイズすることができます。

### 2. 大規模なプロジェクトでも使いやすい

VS Code は、多くの言語に対応しており、大規模なプロジェクトにも適しています。また、Git などのバージョン管理システムに対応しており、コードの変更履歴の管理が容易になります。

### 3. デバッグ機能が充実

VS Code は、豊富なデバッグ機能を備えています。ブレークポイントの設定やステップ実行、ウォッチ式の評価など、デバッグに必要な機能が多数用意されています。

### 4. 多彩なプラグインに対応

VS Code には、多くのプラグインが用意されています。プログラミング言語ごとに最適化されたエディタを利用できるため、開発効率が向上します。

---

従来の開発方法と比べると、VS Code の最大の長所は、上記のような機能が充実しておりなおかつ軽量で高速であることです。  
また、VS Code はオープンソースであり、無料でダウンロードできるため、誰でも気軽に利用できます。そのため、新しい言語やフレームワークに取り組む際には、VS Code を利用することが多くなっています。

## IDE(統合開発環境)とは

IDE とは、Integrated Development Environment の略です。プログラムを開発するために必要な機能を一つのソフトウェアにまとめた開発環境のことです。

## コーディングスタイルとは

コーディングスタイルとは、プログラムの記述方法に関するルールや規約のことです。これによって、複数の開発者が協力してプログラムを開発する場合に、コードの見やすさや保守性、品質を向上させることができます。

コーディングスタイルは、書籍の編集や校正においてのルールや規約と似たものです。例えば、書籍では統一されたフォントやスタイルが用いられ、適切な句読点やスペースの挿入、表記の揺れの統一などが行われます。これによって、読みやすく、分かりやすい書籍が作られます。

同様に、コーディングスタイルによって、統一されたインデント、変数名や関数名の命名規則、コメントの書き方などが定められ、コードの見やすさや品質が向上します。

ただし、書籍と違ってコードは機械が読むため、実行速度やメモリ効率を考慮する必要があります。そのため、コーディングスタイルは単なる見た目の問題に留まらず、実行上のパフォーマンスや品質にも影響を与えます。したがって、コーディングスタイルの遵守は開発効率だけでなく、品質やセキュリティの向上にもつながります。

プログラミングは一人でやるイメージもありますが、どんな時も「人とルールを合わせる」「人が自分のソースコードを読む可能性がある」ことを意識しておく必要はあります。相手の視点に立つはどんな場合でも当てはまりそうです。

次からは、具体的な設定に入っていきます。

---

##
