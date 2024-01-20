#!/bin/bash

# 使用方法の説明
usage() {
  echo "Usage: $0 <tag>"
  echo "例: $0 my-image:latest"
}

# コマンドライン引数のチェック
if [ $# -ne 1 ]; then
  echo "エラー: タグが必要です。"
  usage
  exit 1
fi

# Dockerイメージのタグ
TAG=$1

# CPUアーキテクチャの確認
ARCH=$(uname -m)

# 適切なベースイメージの選択
BASE_IMAGE=""
if [ "$ARCH" = "x86_64" ]; then
  BASE_IMAGE="mysql:8.0"
elif [ "$ARCH" = "arm64" ]; then
  BASE_IMAGE="bitnami/mysql"
else
  echo "サポートされていないアーキテクチャ: $ARCH"
  exit 1
fi

# Dockerビルドの実行
echo "ビルドを開始します: $TAG"
docker build --build-arg BASE_IMAGE=$BASE_IMAGE -t $TAG .
