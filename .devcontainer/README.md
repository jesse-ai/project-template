# Jesse Dev Container Configuration

This directory contains the configuration for developing with Jesse in a containerized environment using VS Code Dev Containers.

## What is a Dev Container?

A dev container allows you to use a Docker container as a full-featured development environment. It can be used to run an application, separate tools, libraries, or runtimes needed for working with a codebase, and can aid in continuous integration and testing.

## Prerequisites

1. **Docker Desktop** or **Docker Engine** installed and running
2. **Visual Studio Code** installed
3. **Dev Containers extension** for VS Code (ms-vscode-remote.remote-containers)

## How to Use

### Option 1: Open in Dev Container (Recommended)

1. Open this project folder in VS Code
2. When prompted, click "Reopen in Container", or
3. Press `F1` and select "Dev Containers: Reopen in Container"

VS Code will:
- Build/pull the Jesse Docker image
- Start all services (Jesse, PostgreSQL, Redis)
- Connect your VS Code to the Jesse container
- Install recommended extensions
- Forward necessary ports

### Option 2: Manual Start

If not prompted automatically:

1. Press `F1` (or `Ctrl+Shift+P` / `Cmd+Shift+P`)
2. Type and select: "Dev Containers: Reopen in Container"
3. Wait for the container to start

## What's Included

### Services
- **jesse**: Main container with Jesse trading bot
- **postgres**: PostgreSQL database (version 14-alpine)
- **redis**: Redis cache (version 6-alpine)

### VS Code Extensions
The following extensions are automatically installed:
- Python support (ms-python.python)
- Pylance for better Python IntelliSense
- Jupyter Notebook support
- Docker support
- GitLens for Git integration
- Code Spell Checker
- Error Lens for inline error display

### Forwarded Ports
- **9000**: Jesse Dashboard (automatically opens)
- **8888**: Jupyter Notebook

## Environment Setup

Before starting the dev container, make sure you have:

1. Created your `.env` file:
   ```bash
   cp .env.example .env
   ```

2. Configured your environment variables in `.env`

## Development Workflow

Once inside the dev container:

1. **Install Jesse strategies**:
   ```bash
   jesse install-live --no-strict
   ```

2. **Run Jesse**:
   ```bash
   jesse run
   ```

3. **Access the dashboard**:
   Open [http://localhost:9000](http://localhost:9000) in your browser

4. **Create new strategies**:
   Add your strategies in the `strategies/` folder

5. **Run backtests**:
   ```bash
   jesse backtest 2020-01-01 2020-12-31
   ```

## Troubleshooting

### Container won't start
- Ensure Docker is running
- Check that ports 9000, 8888 are not already in use
- Try rebuilding: `F1` → "Dev Containers: Rebuild Container"

### Database connection issues
- Ensure PostgreSQL container is running
- Check credentials in `.env` file match docker-compose.yml

### Performance issues
- Allocate more resources to Docker Desktop in preferences
- Close unused applications
- Consider using Docker on Linux for better performance

## Customization

You can customize the dev container by editing `.devcontainer/devcontainer.json`:

- Add more VS Code extensions
- Change Python settings
- Add post-create commands
- Modify port forwarding

## Additional Resources

- [VS Code Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Container JSON Reference](https://containers.dev/implementors/json_reference/)
- [Jesse Documentation](https://docs.jesse.trade/)

## Benefits

✅ No local Python/package installation required  
✅ Consistent development environment across team  
✅ Isolated from host system  
✅ Easy onboarding for new developers  
✅ All tools and dependencies pre-configured  
✅ Automatic extension installation  
✅ Direct access to running services
