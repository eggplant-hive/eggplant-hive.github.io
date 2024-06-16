---
title: "Recommended IDE Setup"
date: "2023-04-20"
---

![](https://assets.st-note.com/production/uploads/images/103551558/rectangle_large_type_2_7f3e39bf183d0e01e08921808153de65.png?width=800)

今回の記事では、 前回作成したプロジェクト(プロジェクト名: pj)直下にある README.md ファイルの 「**Recommended IDE Setup**」を参考にして設定を行います。(※)

## Recommended IDE Setup

### 1\. Volar のインストール

Vue3 を使用している場合は、**Volar プラグイン**をインストールし、**Vetur プラグイン**を**必ず**無効にします。（※参考）

**参考**

[https://twitter.com/vuejs/status/1429195877365780486](https://twitter.com/vuejs/status/1429195877365780486)

### 2\. Vetur プラグインの無効化

### 3\. 「TypeScript Vue Plugin (Volar)」のインストール

TypeScript はデフォルトでは.vue インポートの型情報を扱えないので、型チェックのために tsc CLI を vue-tsc に置き換えます。エディタでは、TypeScript 言語サービスに.vue の型を認識させるために、**TypeScript Vue Plugin（Volar）**が必要です。

### 4\. 「vue-tsc」ライブラリーの追加

Valor によって型の違反はエディタ上に赤線表示がされるようになりますが、コンパイル自体は通ってしまいます。  
そのため型チェックを別で走らせる vue-tsc というライブラリをインストールします。

コンソールから次のコマンドを実行します

```
npm install -D vue-tsc
```

### 5\. package.json の更新

インストール後、package.json に型チェック用のスクリプトを記述して更新します。

```
{
  "name": "auction",
  "author": "Egglass",
  "description": "Sample project for vue3 + vite + electron + typescript + vue-tsc",
  "private": true,
  "version": "0.0.0",
  "main": "dist/electron/main/main.js",
  "scripts": {
    "vite:dev": "vite",
    "vite:build": "vite build && vue-tsc --declaration --emitDeclarationOnly",
    "vite:preview": "vite preview",
    "ts": "tsc",
    "watch": "vue-tsc --noEmit -w",
    "lint": "eslint -c .eslintrc --ext .ts ./src",
    "app:dev": "tsc && concurrently vite \" electron .\" \"vue-tsc --noEmit -w\"",
    "app:build": "npm run vite:build && tsc && electron-builder",
    "app:preview": "npm run vite:build && tsc && electron ."
  },
  "build": {
    "appId": "YourAppID",
    "asar": true,
    "directories": {
      "buildResources": "assets",
      "output": "release/${version}"
    },
    "files": [
      "dist"
    ],
    "mac": {
      "artifactName": "${productName}_${version}.${ext}",
      "target": [
        "dmg"
      ]
    },
    "win": {
      "target": [{
        "target": "nsis",
        "arch": [
          "x64"
        ]
      }],
      "artifactName": "${productName}_${version}.${ext}"
    },
    "nsis": {
      "oneClick": false,
      "perMachine": false,
      "allowToChangeInstallationDirectory": true,
      "deleteAppDataOnUninstall": false
    }
  },
  "dependencies": {
    "vue": "^3.2.47"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^4.1.0",
    "concurrently": "^8.0.1",
    "electron": "^24.0.0",
    "electron-builder": "^24.2.0",
    "typescript": "^4.9.3",
    "vite": "^4.2.0",
    "vue-tsc": "^1.2.0"
  }
}
```

### 6\. tsconfig.json の更新

公式のドキュメントに従って 「compilerOptions.isolatedModules = true」に変更して tsconfig.json を更新します。

```
{
  "compilerOptions": {
    "target": "esnext",
    "useDefineForClassFields": true,
    "module": "commonjs",
    "moduleResolution": "node",
    "strict": true,
    "jsx": "preserve",
    "sourceMap": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "esModuleInterop": true,
    "lib": ["esnext", "dom"],
    "skipLibCheck": true,
    "declaration": true,
    "outDir": "dist/electron"
  },
  "include": ["src/electron/**/*"],
  "references": [{
    "path": "./tsconfig.node.json"
  }]
}
```

###

### 7\. preload.ts の更新

compilerOptions の isolatedModules を 「true」にすると export を追加する必要があります。

preload.ts に 「export {}」を追加して保存します。

```
// src/electron/preload/preload.ts
// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.
window.addEventListener('DOMContentLoaded', () => {
    const replaceText = (selector:any, text:any) => {
      const element = document.getElementById(selector)
      if (element) element.innerText = text
    }

    for (const dependency of ['chrome', 'node', 'electron']) {
      replaceText(`${dependency}-version`, process.versions[dependency])
    }
  })

export {}
```

### 8.「Take Over Mode」を有効化

Volar は、パフォーマンスを向上させるために「**Take Over Mode**」と呼ばれる機能を提供します。「**Take Over Mode**」では、Volar は単一の TS 言語サービス インスタンスを使用して、Vue ファイルと TS ファイルの両方をサポートします。

「**Take Over Mode**」を有効にするには、次の手順に従って、**プロジェクトのワークスペース**で VSCode の組み込み TS 言語サービスを無効にする必要があります。

「**Take Over Mode**」を**有効にする手順（**組み込み TS 言語サービスの無効化**）**

1. プロジェクトのワークスペースで、Ctrl + Shift + P（macOS：Cmd+Shift+P）でコマンドパレットを表示させます。
2. built と入力し、「Extensions: Show Built-in Extensions」を選択します。
3. 拡張機能の検索ボックスに「typescript」と入力します（@builtin の接頭辞は削除しないでください）。
4. 「TypeScript and JavaScript Language Features」の小さな歯車アイコンをクリックし、「Disable (Workspace) 」を選択します。
5. ワークスペースを再読み込みします。Vue または TS のファイルを開くと、「**Take Over Mode**」が有効になります。

##
