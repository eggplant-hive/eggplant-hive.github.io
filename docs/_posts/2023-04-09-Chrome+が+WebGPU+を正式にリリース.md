---
title: "Chrome が WebGPU を正式にリリース"
date: "2023-04-09"
---

Chromeが、4月26日にリリース（予定）のバージョン(113)に「[WebGPU](https://gpuweb.github.io/gpuweb/)」が搭載されます  
  
  
何がすごいかというと、ざっくり説明すると ブラウザーから GPU（画像処理装置）に直接アクセスできるようになるので、開発者目線ではGPUを使って処理している機械学習（AI）の操作が楽になるということです。

ユーザ側（表示側）で言うと、GPUに直接アクセスできることで2Dや3Dの描画のレベルが上がる可能性があります。

今回のリリースでは Chrome113のベータバージョンがテストを経て正式に公開されましたという話です

[https://developer.chrome.com/blog/chrome-113-beta/](https://developer.chrome.com/blog/chrome-113-beta/)

現状 対応OSとしては mac windows chrome OS だけですが、AndroidやLinuxでも対応予定です

ちなみに、 WebGPUはどうやって ブラウザからアクセスするかという約束事がW3C(Web標準化を決める団体)でドキュメントとして纏められているので、  Chromeエンジンを使っていない Safari（iOS）等でも対応が進んでいく予定です

[https://www.w3.org/TR/webgpu/](https://www.w3.org/TR/webgpu/)

* * *

  

大したことは呟いてませんが、noteとTwitter をフォローしていただけると喜びます

[https://twitter.com/eggplant\_3](https://twitter.com/eggplant_3)
