# コンテナから GitHub へ PR を投げる

`app` と `spring` コンテナは SSH agent forwarding を使って GitHub に接続します。
**秘密鍵はコンテナに渡さず、ホストの ssh-agent を経由して認証します。**

## 1. ホスト側: SSH agent の準備

```bash
# ssh-agent が起動していなければ起動
eval $(ssh-agent -s)

# 秘密鍵を agent に登録
ssh-add ~/.ssh/id_ed25519   # 鍵のパスは環境に合わせて変更
```

登録済みの鍵を確認するには:
```bash
ssh-add -l
```

## 2. コンテナ起動

```bash
docker compose up --build
```

> `SSH_AUTH_SOCK` が未設定だとソケットのマウントが失敗します。
> 起動前に `echo $SSH_AUTH_SOCK` で確認してください。

## 3. コンテナ内: gh CLI の認証（初回のみ）

```bash
# コンテナにシェルで入る
docker compose exec app bash   # または spring

# gh CLI でログイン（ブラウザ or トークン）
gh auth login
```

`GITHUB_TOKEN` 環境変数を使う場合はログイン不要です。`docker-compose.yml` の `environment` に追加してください:

```yaml
environment:
  - GITHUB_TOKEN=your_token_here
```

## 4. PR の作成

```bash
cd /project
git checkout -b feature/your-branch
git add .
git commit -m "your message"
git push origin feature/your-branch
gh pr create
```
