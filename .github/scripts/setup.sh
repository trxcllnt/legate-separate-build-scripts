echo "pwd: $(pwd)";
echo "uid: $(whoami) $(id -u):$(id -g)";
echo "env:";
env;
ls -all .;

cp -ar repo/home/coder/.local /home/coder/.local;
cp -ar repo/home/coder/.gitconfig /home/coder/.gitconfig;
chmod +x /home/coder/.local/bin/*;
chown -R coder:coder /home/coder/;
rm -rf repo;

apt update;
DEBIAN_FRONTEND=noninteractive \
apt install -y --no-install-recommends \
    numactl rlwrap;
