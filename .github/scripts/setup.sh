#! /usr/bin/env bash

mv repo/home/coder/.local /home/coder/;
cp repo/home/coder/.gitconfig /root/;
mv repo/home/coder/.gitconfig /home/coder/;
chmod +x /home/coder/.local/bin/*;
chown -R coder:coder /home/coder/;

apt update;
DEBIAN_FRONTEND=noninteractive \
apt install -y --no-install-recommends \
    numactl rlwrap;
