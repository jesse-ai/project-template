# Podman Instructions

```shell
apt update
apt install -y podman
# TODO instructions on putting `*.container` in `/etc/containers/systemd`

useradd -d /var/lib/postgresql -Mr postgres
mkdir -p /var/lib/postgresql/data
chown -R postgres:postgres /var/lib/postgresql

useradd -d /var/lib/redis -Mr redis
# I didn't bother creating /var/lib/redis

useradd -d /opt/jesse -Mr jesse
mkdir -p /opt/jesse
cd /opt/jesse
git clone https://github.com/jesse-ai/project-template.git home
cp home/.env.example env
chown root:jesse env
chmod 640 env
```
