# Dockerfileのビルド
CPUのアーキテクチャに応じてベースイメージを変更するようにしました。
必要に応じてDockerfile、build.shを変更して使用してください。

1. ビルドスクリプトを実行可能にします。
   - `$ chmod +x build.sh`

2. スクリプトを実行してDockerイメージをビルドします。
   - `$ ./build.sh my-image:latest`

