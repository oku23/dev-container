#!/bin/bash
# springコンテナへの接続スクリプト
docker compose -f /project/docker-compose.yml --project-name strava-analyzer exec spring bash
