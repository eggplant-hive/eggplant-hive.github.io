---
title: "第4回 EditorConfigの設定"
date: "2023-04-29"
tags: [EditorConfig, VSCode]
categories: [VSCode, プログラミング]
---

![](https://assets.st-note.com/production/uploads/images/104082824/rectangle_large_type_2_22c85d177d2054efc4084e4372711fc7.png?width=800)

今回は、VSCode の EditorConfig の設定を行います。

## EditorConfig とは

EditorConfig は、**複数の人が同じコードを書く場合に、コードのスタイルや書式を統一するための設定ファイル**です。

エディターの設定ファイルを共有することで、**コードの見た目やフォーマットが揃うため、コードの可読性を向上させる**ことができます。

EditorConfig に対応しているエディターは次の通りです。「何もしなくても EditorConfig が有効」（**プラグインが不要**）なエディターと 「エディターのプラグインをインストールすることで有効」（**プラグインが必要）**なエディターがあります。

VSCode は、後者の 「プラグインが必要な」エディターです。

### 対応しているエディター

**プラグインが不要**

![](https://assets.st-note.com/img/1682689974167-Ph5BkmCjFQ.png)

**プラグインが必要**

![](https://assets.st-note.com/img/1682690322565-4fbDVMzcaq.png)

EditorConfig は、プロジェクトルートディレクトリに ".editorconfig" という名前のファイルを作成して設定を記述します。

- タブを使うかスペースを使うか
- インデントのサイズは何文字か
- 改行コードは何を使うか

などを指定できます。また、拡張子ごとに異なる設定をすることもできます。

EditorConfig を使うことで、コードのスタイルの統一が容易になり、開発効率を向上させることができます。

## EditorConfig プラグインの導入

### プラグインのインストール

１．ショートカットキー Ctrl+Shift+X で拡張ビューを表示。

![](https://assets.st-note.com/img/1682739628598-4rN14qolwz.png) **拡張ビュー アイコン**

２．検索窓に「editorconfig」と入力

![](https://assets.st-note.com/img/1682708244199-de4d6Bi9dK.png)

３．「EditorConfig for VS Code」のインストールボタンを押しインストール

![](https://assets.st-note.com/production/uploads/images/104198892/picture_pc_bfeef49a93daec5ce67aa23526136f60.gif?width=2000&height=2000&fit=bounds&quality=85)

### .editorconfig ファイルの作成

１．エクスプローラビューのプロジェクトのルートディレクトリで右クリック

![](https://assets.st-note.com/img/1682738563328-IeN3xjEgEl.png)

２．「Generate .editorconfig」メニューをを選択

３．プロジェクトのルートディレクトリ に .editorconfig ファイルが追加されていることを確認。

![](https://assets.st-note.com/production/uploads/images/104199116/picture_pc_21697bd27eec2bd173994d57549de423.gif?width=2000&height=2000&fit=bounds&quality=85)

## EditorConfig の書き方

EditorConfig の書き方については次の通りです。

1.  ".editorconfig"というファイルをプロジェクトルートに作成する
2.  文字コードは UTF-8 で書く
3.  改行コードは LF にする。（※ CRLF か LF を使用可能だが、改行コードを他のファイルと揃えるため LF にする）
4.  "\*.拡張子"のように、対象のファイル拡張子を指定する
5.  4 を ［］で囲む
6.  "key = value"のように、設定項目（プロパティ）とその値を指定する
7.  複数の設定項目を指定する場合は、改行して記述する
8.  "#" あるいは ; で始まる行はコメントとして扱われる

以下は、一例です。

```
# EditorConfigの設定例

# すべてのファイルに適用される設定
root = true

# Markdownファイルに適用される設定
[*.{md,markdown}]
max_line_length = 80
trim_trailing_whitespace = true

# JavaScriptファイルに適用される設定
[*.js]
indent_style = space
indent_size = 2
```

上記の例では、プロジェクトルートに ".editorconfig" という名前のファイルが作成され、Markdown ファイルには最大行数が 80 文字に制限され、JavaScript ファイルには半角スペース 2 つでインデントされるという設定が適用されます。

---

**参考： vuejs の.editorconfig ファイルの設定**

EditorConfig の設定は「vue」で開発していますので、vuejs の設定に揃えます。

[https://github.com/vuejs/vue/blob/main/.editorconfig](https://github.com/vuejs/vue/blob/main/.editorconfig)

### 対象とするファイルの指定方法

対象とするファイルの指定には、任意の文字を示す「ワイルドカード」を使用することが出来ます。使用できる「ワイルドカード」は、以下の通りです。

> \* パスの区切り文字 (/)を除く任意の文字列  
> \*\* 任意の文字列  
> ? 任意の一文字  
> \[name\] name の任意の 1 文字  
> \[!name\] name に含まれない任意の 1 文字  
> {s1,s2,s3}  s1 s2 s3 のいずれかと一致する文字列  
> {num1..num2} num1 と num2 の間の任意の整数値。num1 と num2 は正でも負でもよい

### 設定出来るプロパティのキーと値

プロパティで、「unset」の値を指定した時は、以前に設定されていたプロパティの値をクリアします。全てのプロパティで「unset」は指定出来ます。

例えば、

```
indent_size = unset
```

と設定すると、indent_size プロパティの定義がクリアされ、エディターで指定されている値が使用されます。

**参考**

```
export interface KnownProps {
  end_of_line?: 'lf' | 'crlf' | 'unset'
  indent_style?: 'tab' | 'space' | 'unset'
  indent_size?: number | 'tab' | 'unset'
  insert_final_newline?: true | false | 'unset'
  tab_width?: number | 'unset'
  trim_trailing_whitespace?: true | false | 'unset'
  charset?: string | 'unset'
}
```

[https://github.com/editorconfig/editorconfig-core-js/blob/main/src/index.ts](https://github.com/editorconfig/editorconfig-core-js/blob/main/src/index.ts)

またプロパティの値はコアライブラリーにより小文字に変換されますので、大文字と小文字のどちらも使用出来ます。

**root**

> ファイルを開いたとき、EditorConfig プラグインは開いたファイルのディレクトリとすべての親ディレクトリにある.editorconfig という名前のファイルを探します。.editorconfig ファイルの検索は、ルートファイルパスに到達するか、**root=true**の EditorConfig ファイルが見つかれば停止します。

**公式**

**設定例**

```
root = true
```

**indent_style**

インデントのスタイル（タブかスペースのいずれかを指定します）。vuejs の設定に合わせて、「**space**」を設定します。

**設定可能な値**

- tab
- space

**対応エディター**

- 全て

**設定例**

```
indent_style=space
```

**indent_size**

インデントのサイズ (半角文字を使用)。vuejs の設定に合わせて、「**2**」を設定します。

**設定可能な値**

- 正の整数（自然数）
- tab

> 1\. indent_style = tab かつ   indent_size が設定されていないときは、indent_size = tab を設定する  
> 2.  indent_size が「整数」で指定されていたときは、tab_width の値は indent_size の値と一致する  
> 3.  indent_size = tab の時は、インデントのサイズは  tab_width で設定された値（数字）と一致する

**参考：ソースコード（JS）**

```
  // Set indent_size to 'tab' if indent_size is unspecified and
  // indent_style is set to 'tab'.
  if (
    'indent_style' in matches
    && matches.indent_style === 'tab'
    && !('indent_size' in matches)
    && semver.gte(version, '0.10.0')
  ) {
    matches.indent_size = 'tab'
  }

  // Set tab_width to indent_size if indent_size is specified and
  // tab_width is unspecified
  if (
    'indent_size' in matches
    && !('tab_width' in matches)
    && matches.indent_size !== 'tab'
  ) {
    matches.tab_width = matches.indent_size
  }

  // Set indent_size to tab_width if indent_size is 'tab'
  if (
    'indent_size' in matches
    && 'tab_width' in matches
    && matches.indent_size === 'tab'
  ) {
    matches.indent_size = matches.tab_width
  }
```

**対応エディター**

- 全て

**設定例**

```
indent_size=2
```

**tab_width**

タブの幅。vuejs の設定に合わせて、**indent_style に**スペース(space)を使用するため、**tab_width**の値は設定しません。

indent_size が数字で指定されていた場合は、**tab_width の初期値は indent_size と一致**します。

**設定可能な値**

- 正の整数（自然数）

**対応エディター**

- 全て

**設定例**

```
tab_width = 2
```

**end_of_line**

改行コード (Unix, DOS, Mac)。vuejs の設定に合わせて、「**lf**」を設定します。

**設定可能な値**

- cr: Mac OS X 以前
- lf: Linux、Mac OS X
- crlf: Windows

**対応エディター**

- 全て

**設定例**

```
end_of_line=lf
```

**charset**

文字コード。「utf-8」を設定します。

**設定可能な値**

- latin1
- utf-8
- utf-16be
- utf-16le
- utf-8-bom

**設定例**

```
charset=utf-8
```

**trim_trailing_whitespace**

行末尾の空白（ホワイトスペース）を削除するかどうか。「true」に設定します。但し、「マークダウン形式」のファイルでは 「行末に半角スペース 2 つ」で 「改行」を意味しますので  「false」に設定します。

**設定可能な値**

- true: 改行文字の前にある空白文字を削除する。
- false: 改行文字の前にある空白文字を削除しない。

**設定例**

```
trim_trailing_whitespace=true

[*.{md,markdown,mdx}]
trim_trailing_whitespace = false
```

**insert_final_newline**

ファイル末尾に空行を挿入するかどうか。「true」に設定します。画像ファイルは、改行を削除することでファイルサイズを減らせる可能性があるので 「false」に設定します。

**設定可能な値**

- true
- false

**設定例**

```
insert_final_newline=true

[*.{svg,gif,png,jpg,jpeg}]
insert_final_newline = false
```

**max_line_length**

指定された文字数の後に「強制改行」を行います。 「off」 でこの機能をオフにします（エディタの設定を使用します）。VsCode では「**max_line_length**」のプロパティに対応していないため設定をしていません。

**設定可能な値**

- 正の整数（自然数）
- off

**対応エディター**

- Emacs
- Vim
- Atom
- ReSharper and Rider
- AppCode, IntelliJ IDEA, PhpStorm, PyCharm, RubyMine, and WebStorm
- Kakoune
- Prettier

**設定例**

```
max_line_length=80
```

## EditorConfig の設定

### EditorConfig のファイルフォーマット

最終的に、VsCode の EditorConfig のファイルフォーマットは、次のようになりました。

```
# EditorConfig is awesome: https://EditorConfig.org

# top-most EditorConfig file
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.{md,markdown,mdx}]
trim_trailing_whitespace = false

# FOR WINDOWS
[*.{ps1,psm1}]
charset = utf-8-bom

# FOR WINDOWS
[*.{bat,cmd}]
end_of_line = crlf

[*.{svg,gif,png,jpg,jpeg}]
insert_final_newline = false
```

###

## 参考

[https://editorconfig.org/](https://editorconfig.org/)
