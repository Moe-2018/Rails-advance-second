## 研修「Rails の応用」課題

基礎で学んだことを活かし、Ruby on Rails 7 を使用したシステム構築を行っていただきます。
このファイルを読み、環境構築が完了した方から docs/FUNCTIONS.md を読み作業に取り掛かってください。

なお、バージョン情報は以下のとおりです

- Ruby 3
- Rails 7
- PostgreSQL

### 環境構築

#### devcontainer の install

[インストール参考資料](https://blog.kinto-technologies.com/posts/2022-12-10-VSCodeDevContainer/)

#### git の設定

1. 前の研修で git と Github について学習済みのはずです。自分の Gihub アカウントに、まず空のリポジトリを作成しましょう。
2. そして、以下のコマンドを実行します。(user.name と user.email はご自身のものを入力)

```
git config --global user.name xxxx
git config --global user.email xxxx@xxxx.com
```

#### 動作確認

##### devcontainer の起動

1. vscode 上で「ctrl + shift + P」を入力
2. 「Dev Containers: Rebuild and Reopen in Container 」を選択

##### devcontainer 起動後

1. vscode の確認
   追加で入れた拡張機能やディレクトリ構成があっていることを確認する。

2. git の確認
   下記のコマンドでホスト側で行った確認と同じ出力が出ることを確認。

```
ssh -T git@github.com
```

3. .git を削除 (初回のみ)

```
rm -rf .git
```

4. 先に作成した空のリポジトリにクローンしたこのリポジトリをプッシュ。 (初回のみ)

- リポジトリへのプッシュ方法は作成したリポジトリに記載されていますのでご確認を。

5. 以下のコマンドを実行し、localhost:3000 にアクセスする

```
./bin/setup
./bin/dev
```

`注意事項`

このリポジトリでは、あらかじめいろんな設定が全て完了しています。Gem などは実装時に必要なものだけを追加していくようにしてください。

#### 作業の進め方

この応用編では、実際に main ブランチから 各ブランチを作成し、作成したブランチから実装や修正など作業を進めていただきます。  
`決してmainブランチにて作業を進めないようにだけ注意してください`  
詳しくは[Notion にある Git 運用ルール](https://www.notion.so/soramedia/Git-4b40f92582e64a9aba52c847ea5a29e3)をご確認ください。  
そして docs にあります、CHECKLIST.md は作業の確認用、FUNCTIONS.md は実装にあたっての要件やシナリオが記載されています。それを読み取り何を実装すべきか、どのタイミングで PR を出すのか、コミットをどこまで細かく分けるのか、ご自身で考えながら作業を進めましょう。
