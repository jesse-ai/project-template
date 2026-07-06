# Docker Setup for Jesse Trading Bot

## Architecture

This Docker setup includes:
- **Jesse Trading Bot** with dashboard on port 9000
- **Jupyter Notebook** for analysis and development on port 8888
- **PostgreSQL** for database
- **Redis** for caching

## Prerequisites

- Docker Desktop installed
- `.env` file at project root (copy from `.env.example`)

## Getting Started

### First time (build the image)

```bash
cd docker
docker-compose up --build -d
```

### Subsequent starts

```bash
cd docker
docker-compose up -d
```

## Access Services

### Jesse Dashboard
- **URL**: http://localhost:9000
- No authentication required by default

### Jupyter Notebook
- **URL**: http://localhost:8888
- **Authentication**: Token required

#### Get Jupyter Token

Jupyter generates a unique token on each container start for security. To retrieve it:

**Method 1 - From container logs:**
```bash
docker logs jesse | grep token
```

**Method 2 - From Jupyter log file:**
```bash
docker exec jesse cat /var/log/jupyter.log | grep token
```

**Example output:**
```
http://127.0.0.1:8888/tree?token=c39a0eb4f91cf2d7a05edb35a2282f64147726b16b078a2a
```

You can either:
1. Click the full URL with the token
2. Go to http://localhost:8888 and enter the token when prompted

**Note:** The token changes every time the container restarts. If you need a persistent token or want to disable authentication (not recommended), see the Customization section below.

## Useful Commands

### View logs
```bash
# All services
docker-compose logs -f

# Jesse only
docker-compose logs -f jesse

# Jupyter logs
docker exec jesse tail -f /var/log/jupyter.log
```

### Stop services
```bash
docker-compose down
```

### Stop and remove volumes
```bash
docker-compose down -v
```

### Rebuild the image
```bash
docker-compose build --no-cache
docker-compose up -d
```

### Execute commands in container
```bash
# Open a shell
docker exec -it jesse bash

# Run Jesse command
docker exec jesse jesse backtest 2020-01-01 2020-12-31
```

## File Structure

```
docker/
├── Dockerfile          # Custom image with Jupyter
├── docker-compose.yml  # Service orchestration
├── start.sh           # Startup script (Jesse + Jupyter)
└── postgres-data/     # PostgreSQL data (auto-generated)
```

## Customization

### Add Python packages

Edit the `Dockerfile` and add your packages in the `RUN pip install` section:

```dockerfile
RUN pip install --no-cache-dir \
    jupyter \
    notebook \
    your-package-here
```

Then rebuild:
```bash
docker-compose build --no-cache
docker-compose up -d
```

### Disable Jupyter authentication (not recommended)

If you're working in a completely isolated local environment and want to disable Jupyter authentication, edit `start.sh`:

```bash
jupyter notebook \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --notebook-dir=/home \
    --NotebookApp.token='' \
    --NotebookApp.password='' \
    > /var/log/jupyter.log 2>&1 &
```

Then rebuild the container:
```bash
docker-compose build --no-cache
docker-compose up -d
```

**⚠️ Security Warning:** Disabling authentication exposes Jupyter to anyone who can access your network. Only do this in completely isolated development environments.

### Set a custom Jupyter password

Instead of using tokens, you can set a permanent password:

1. Generate a password hash:
```bash
python3 -c "from jupyter_server.auth import passwd; print(passwd('your_password'))"
```

2. Edit `start.sh` and add the password hash:
```bash
jupyter notebook \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --notebook-dir=/home \
    --NotebookApp.password='your_generated_hash' \
    > /var/log/jupyter.log 2>&1 &
```

3. Rebuild:
```bash
docker-compose build --no-cache
docker-compose up -d
```

### Change passwords

Edit the `.env` file at project root:

```env
PASSWORD=your_jesse_password
POSTGRES_PASSWORD=your_postgres_password
# Add other environment variables as needed
```

## Troubleshooting

### Ports already in use
If ports 9000 or 8888 are already in use, modify in `docker-compose.yml`:
```yaml
ports:
  - "9001:9000"  # Change 9001 to available port
  - "8889:8888"  # Change 8889 to available port
```

### Jupyter not starting
Check the logs:
```bash
docker exec jesse cat /var/log/jupyter.log
```

### Complete rebuild
```bash
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d
```

### Jesse not responding
Restart the container:
```bash
docker-compose restart jesse
```

## Environment Variables

Create a `.env` file at the project root:

```env
PASSWORD=test
APP_PORT=9000

POSTGRES_HOST=postgres
POSTGRES_NAME=jesse_db
POSTGRES_PORT=5432
POSTGRES_USERNAME=jesse_user
POSTGRES_PASSWORD=password

REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=

LICENSE_API_TOKEN=
```

## Support & Documentation

- **Jesse Trading Bot**: https://docs.jesse.trade
- **Jupyter Documentation**: https://jupyter-notebook.readthedocs.io
- **Docker Compose**: https://docs.docker.com/compose/
