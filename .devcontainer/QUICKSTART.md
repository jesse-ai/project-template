# Quick Start Guide - Dev Container Setup

This guide will help you get started with Jesse using VS Code Dev Containers in just a few minutes!

## 🚀 What You'll Get

- **Zero local setup**: No need to install Python, packages, or dependencies
- **Pre-configured environment**: Everything works out of the box
- **VS Code integration**: Full IDE support with debugging, IntelliSense, and more
- **All services running**: Jesse, PostgreSQL, and Redis automatically started
- **Team consistency**: Everyone uses the same development environment

## 📋 Prerequisites

Before you begin, make sure you have:

1. ✅ **Docker Desktop** installed and running
   - [Download for Windows/Mac](https://www.docker.com/products/docker-desktop)
   - Linux: Install Docker Engine and Docker Compose

2. ✅ **Visual Studio Code** installed
   - [Download here](https://code.visualstudio.com/)

3. ✅ **Dev Containers extension** for VS Code
   - Install from [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
   - Or: Open VS Code → Extensions (Ctrl+Shift+X) → Search "Dev Containers" → Install

## 🎯 Step-by-Step Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/jesse-ai/project-template.git my-jesse-bot
cd my-jesse-bot
```

### Step 2: Configure Environment

```bash
cp .env.example .env
```

Edit `.env` to add your configuration (API keys, exchange credentials, etc.)

### Step 3: Open in VS Code

```bash
code .
```

### Step 4: Reopen in Container

You'll see a notification asking to "Reopen in Container":

![Reopen in Container notification](https://code.visualstudio.com/assets/docs/devcontainers/containers/dev-container-reopen-prompt.png)

Click **"Reopen in Container"**

**OR** manually:
- Press `F1` (or `Ctrl+Shift+P` / `Cmd+Shift+P`)
- Type: `Dev Containers: Reopen in Container`
- Press Enter

### Step 5: Wait for Initialization

First time setup may take 5-10 minutes:
- Docker pulls the Jesse image
- Starts PostgreSQL and Redis
- Installs VS Code extensions
- Configures the environment

You'll see progress in the bottom-right corner.

### Step 6: Start Coding! 🎉

Once loaded:

1. **Terminal access**: Open a new terminal (Ctrl+` or Terminal → New Terminal)
   - You're now inside the Jesse container!

2. **Test the installation**:
   ```bash
   jesse -v
   ```

3. **Access the dashboard**:
   - Open [http://localhost:9000](http://localhost:9000)
   - Or click the notification for forwarded port 9000

4. **Create your first strategy**:
   ```bash
   jesse make-strategy MyStrategy
   ```
   - Find it in `strategies/MyStrategy/`

## 🔧 Common Commands

Inside the container terminal:

```bash
# Run backtest
jesse backtest 2020-01-01 2020-12-31

# Import candles
jesse import-candles 'Binance' 'BTC-USDT' '2020-01-01'

# Run live trading (paper or real)
jesse run

# Install additional packages
pip install some-package

# Run Jupyter Notebook
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

## 🐛 Troubleshooting

### "Cannot connect to Docker daemon"
- **Solution**: Make sure Docker Desktop is running
- Check Docker icon in system tray

### Port already in use (9000 or 8888)
- **Solution**: Stop other services using these ports
- Or modify ports in `docker/docker-compose.yml`

### Container won't start
1. Check Docker Desktop has enough resources (Settings → Resources)
2. Try rebuilding: `F1` → "Dev Containers: Rebuild Container"
3. Check Docker logs in Docker Desktop

### Database connection errors
- **Solution**: Ensure PostgreSQL container is running
- Check credentials in `.env` match `docker-compose.yml`
- Container name should be: `postgres`

### Slow performance
- **Windows/Mac**: Allocate more RAM to Docker Desktop (Settings → Resources)
- **WSL2 (Windows)**: Use WSL2 filesystem, not Windows filesystem
- **Mac**: Consider using Rosetta 2 emulation if on Apple Silicon

## 💡 Tips & Tricks

### Accessing the Database

Connect to PostgreSQL:
```bash
psql -h postgres -U jesse_user -d jesse_db
# Password: password (from docker-compose.yml)
```

### Installing Python Packages Permanently

Add them to a `requirements.txt` file in your project root, then:
```bash
pip install -r requirements.txt
```

### Using Jupyter Notebook

1. Start Jupyter:
   ```bash
   jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
   ```
2. Click the forwarded port 8888 in VS Code
3. Copy the token from terminal

### Debugging Python Code

1. Set breakpoints in VS Code (click left of line number)
2. Press `F5` or Run → Start Debugging
3. Select "Python" debugger

### Git from Inside Container

Git is pre-configured and uses your host credentials:
```bash
git status
git add .
git commit -m "My changes"
git push
```

## 📚 Next Steps

1. **Read Jesse docs**: [https://docs.jesse.trade/](https://docs.jesse.trade/)
2. **Explore example strategy**: Check `strategies/ExampleStrategy/`
3. **Join the community**: [Jesse Discord](https://discord.gg/5dtFfBm)
4. **Customize dev container**: Edit `.devcontainer/devcontainer.json`

## 🆘 Getting Help

- **Jesse Documentation**: [https://docs.jesse.trade/](https://docs.jesse.trade/)
- **Dev Container Docs**: [https://code.visualstudio.com/docs/devcontainers/containers](https://code.visualstudio.com/docs/devcontainers/containers)
- **Jesse Discord**: [https://discord.gg/5dtFfBm](https://discord.gg/5dtFfBm)
- **GitHub Issues**: [https://github.com/jesse-ai/jesse](https://github.com/jesse-ai/jesse)

---

Happy Trading! 📈🚀
