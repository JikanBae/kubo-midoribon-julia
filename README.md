# kubo-midoribon-julia

久保拓弥『データ解析のための統計モデリング入門』をJuliaでやってみます。

* 久保さんの書籍ページ：http://hosho.ees.hokudai.ac.jp/~kubo/ce/IwanamiBook.html
* Amazon.co.jp：https://amzn.to/2Cg5vDJ

本文に書いてあるRコードをJuliaに置き換えて計算をしたりグラフを作ったりします。プログラムを使わない説明部分については、まとめることはしません。あくまでもプログラム部分のみなので、書籍を読みながらじゃないと分からないことだらけだと思います。

また、可能な限り非Juliaなものに頼らないでやりたい、というのを方針としたいです。なので[WinBUGS](http://winbugs-development.mrc-bsu.cam.ac.uk)/[JAGS](http://mcmc-jags.sourceforge.net)や[Stan](https://mc-stan.org)については、[Stan.jl](https://github.com/StanJulia/Stan.jl)（別途[CmdStan](http://mc-stan.org/interfaces/cmdstan)のインストールが必要）ではなく[Klara.jl](https://github.com/JuliaStats/Klara.jl)とか[Turing.jl](https://github.com/TuringLang/Turing.jl)とかを勉強して書き換えたい……。どうなることやら。

以下、閲覧用のリンクです。

* 第2章「確率分布と統計モデルの最尤推定」
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch2.ipynb
* 第3章「一般化線型モデル（GLM） ---ポアソン回帰---」
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch3.ipynb
* 第4章「GLMのモデル選択 ---AICとモデルの予測の良さ---」
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch4.ipynb
* 第5章「GLMの尤度比検定と検定の非対称性」
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch5.ipynb
* 第6章「GLMの応用範囲を広げる ---ロジスティック回帰など---」
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch6.ipynb
* 第7章「一般化線形混合モデル（GLMM） ---個体差のモデリング---」（途中）
  - https://nbviewer.jupyter.org/github/JikanBae/kubo-midoribon-julia/blob/master/ch7.ipynb
