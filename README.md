# CP Quiz Bazzar

競技プログラミング（CP）や技術に関するクイズを投稿・解答できるプラットフォームです。
ユーザー自身がクイズを作成し、共有することで知識を深め合うことができます。

## プロダクト概要

「クイズ」を通じて学習を楽しむためのアプリケーションです。
ユーザーはアカウントを作成してクイズを投稿したり、他のユーザーが作成したクイズに挑戦したりできます。解答結果や「いいね」、コメントを通じてコミュニティ内での交流も可能です。

## 機能

1.  **ユーザー認証**:
    *   新規登録、ログイン、ログアウト機能
    *   マイページでの履歴確認
2.  **クイズ機能**:
    *   クイズの一覧表示・詳細表示
    *   クイズへの解答（ゲスト解答も一部対応）
    *   正誤判定と解説表示
3.  **クイズ作成・管理**:
    *   クイズの作成、編集、削除
    *   選択肢（Quiz Options）の管理
4.  **ソーシャル機能**:
    *   クイズへの「いいね」
    *   コメント投稿・閲覧
5.  **履歴管理**:
    *   解いたクイズの記録（Solved Quizzes）

## 環境変数

開発環境（Development）においては、標準設定で動作するように構成されています。
本番環境等で必要な場合は、Railsの標準的な認証情報管理（`config/credentials.yml.enc`）や環境変数を使用します。

## セットアップ手順

本プロジェクトは Ruby on Rails で構築されています。以下の手順でローカル環境を構築してください。

### 1. 前提条件

*   Ruby 3.3.6
*   SQLite3

### 2. 環境構築

1.  **リポジトリのクローン**
    ```bash
    git clone <repository_url>
    cd cp_quiz_bazzar
    ```

2.  **依存ライブラリのインストール**
    ```bash
    bundle install
    ```

3.  **データベースのセットアップ**
    データベースの作成とマイグレーションを実行します。
    ```bash
    bin/rails db:setup
    ```
    ※ `db:setup` は `db:create`, `db:schema:load`, `db:seed` を実行します。

### 3. アプリケーションの起動

以下のコマンドでサーバーを起動します。

```bash
bin/rails server
```
または、`bin/dev` が使用可能な場合はそちらを使用してください。

ブラウザで `http://localhost:3000` にアクセスするとアプリが表示されます。

## 技術スタック

### バックエンド / フロントエンド
*   **Language**: Ruby 3.3.6
*   **Framework**: Ruby on Rails 8.0.2
*   **Database**: SQLite3
*   **Frontend**: Hotwire (Turbo / Stimulus), Propshaft (Asset Pipeline)
*   **Styling**: (CSS framework verification needed, likely custom or standard Rails styles)

### 主要ライブラリ
*   **Authentication**: Bcrypt (has_secure_password)
*   **Deployment**: Kamal
*   **Asset Management**: Propshaft, Importmap

## 補足

本リポジトリは、ソニックガーデンキャンプで作成されたアプリケーションをもとにしています。