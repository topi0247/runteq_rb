# ブランチ名の付け方
下記プレフィックスを付けてください\
（プレフィクス＝接頭語、今回でいうと名前からどのタイプのブランチかわかるようにするためのもの）

| プレフィクス名 | 意味 |
| :-- | :-- |
| feature | 機能追加、コード追加 |
| remove | 機能削除やコード削除 |
| fix | 修正系 |
| chore | アプリに直接関係ないもの（README更新とか） |
| hotfix | 緊急度の高い修正 |

「どんなブランチか」がわかればOKです。ブランチ名の長さは特に気にしていないです。\
例：プロポーザルでユーザーの投稿一覧機能の追加…`feature/proposal_user_posts_index`

# コミット名とプルリク名
下記プレフィックスを付けてください\

| プレフィクス名 | 意味 |
| :-- | :-- |
| **feat** | 機能追加、コード追加 |
| remove | 機能削除やコード削除 |
| fix | 修正系 |
| chore | アプリに直接関係ないもの（README更新とか） |
| hotfix | 緊急度の高い修正 |

一目で何をしたか分かる程度の内容でお願いします。\

# 環境構築方法
下記コマンドをお願いします。

## 最初だけやるもの
```bash
git clone git@github.com:topi0247/runteq_rb.git
cd runteq_rb
touch .env
make setup
```
.envの中には下記を記載
```
GITHUB_KEY=
GITHUB_SECRET=
GITHUB_ACCESS_TOKEN=
INVITATION_NICKNAMES=
```
各中身はDiscordにてお伝えします。

## up
```bash
make up
```
`docker compose up`でも可
※カリキュラムである`bin/dev`はやらなくてOKです。

## コマンド
今回特殊な環境構築をしているので、コンテナ内でrailsコマンドを行うときは下記の様にやってください。
```bash
# bin/rails やりたいコマンド
# 例：コントローラ作成
bin/rails g controller static_pages
# コンテナの外からならこう
docker compose exec web bin/rails g controller static_pages
```

## 楽ちんコマンド
下記コマンドで簡単にアレコレできます
```bash
# up
make up
# down
make down
# build
make build
# コンテナに入る
make bash
# db:create
make db-create
# db:migrate
make db-migrate
```