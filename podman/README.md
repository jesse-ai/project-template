# Podman Instructions

I did this on Ubuntu but change the `apt` commands and this should work on other
Linux flavors.

Users are created for each service so they don't run as `root`. Podman handles running the
containers as that user.

```shell
apt update
apt install -y podman
# TODO instructions on putting `*.container` in `/etc/containers/systemd`

useradd -d /var/lib/postgresql -Mr postgres
mkdir -p /var/lib/postgresql/data
chown -R postgres:postgres /var/lib/postgresql

useradd -d /var/lib/redis -Mr redis
# I didn't bother creating /var/lib/redis

useradd -d /opt/jesse/home -Mr jesse
mkdir -p /opt/jesse
cd /opt/jesse
git clone https://github.com/jesse-ai/project-template.git home
chown -R jesse:jesse home
cp home/.env.example env
chown root:jesse env
chmod 640 env
```
