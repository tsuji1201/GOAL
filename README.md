# GOAL

## 概要
お気に入りの選手を投稿し、他のユーザーの方と共有することができます。特にお気に入りの選手には、いいねをつけたり、コメントをする事もできます。

[![Image from Gyazo](https://i.gyazo.com/9ea7f1934f4463d7c9bc536033518c4b.jpg)](https://gyazo.com/9ea7f1934f4463d7c9bc536033518c4b)

## バージョン
- macOS Catalina 10.15.5
- Rails 5.2.4.3
- Ruby 2.5.1
- Heroku

## デプロイ情報
- Heroku URL

  https://shielded-headland-71945.herokuapp.com/

- テストアカウント
  - メールアドレス：test@test
  - パスワード：111111

## 機能
### ユーザー
- ユーザー新規登録、ログイン、ログアウト
- マイページに自分の投稿した一覧表示

### プレイヤー
- 新規投稿、編集、削除
- 選手名の曖昧検索
- 投稿者のリンクからマイページへ遷移可能
- 非同期通信によるコメント機能
- ホーム画面もしくは詳細画面から選手にいいね機能を付加

## 今後実装したい事
- gem(OmniAuth)を用いたSNSのAPIを用いたユーザーが新規投稿などのサービスの利用
- 選手名以外での検索機能
- より選手について語り合えるチャット機能

## DB設計

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

#### Association
- has_many :players
- has_many :comments       
- has_many :favorites 

### playersテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|country_id|integer|null: false, foreign_key: true|
|position_id|integer|null: false, foreign_key: true|
|age_id|integer|null: false, foreign_key: true|
|text|string||

#### Association
- belongs_to :user
- has_many :favorites
- has_many :comments 

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|player_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :player

### favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|player_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :player


　　
