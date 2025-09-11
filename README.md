# Devcontainer (docker-compose) 簡易セットアップ

前提: Docker と VS Code (Remote - Containers / Dev Containers 拡張) がインストール済み。

推奨ワークフロー:
1. このフォルダを VS Code で開く。
2. コマンドパレットで「Reopen in Container」または右下のポップアップで開く。
   - VS Code が自動的に docker-compose を使ってコンテナを起動します。
3. 手動で立ち上げたい場合（ターミナル）:
```bash
docker compose up --build
```

DB の接続情報(デフォルト):
- host: db
- user: dev
- password: devpass
- database: devdb

必要に応じて Node バージョンや環境変数、サービスは `docker-compose.yml` と `.devcontainer/Dockerfile` を編集してください。
