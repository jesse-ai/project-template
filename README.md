# Jesse Project Template

This is template from which you can create your own Jesse project. 

## Usage

### Option 1: Using Dev Container (Recommended for Development)

The easiest way to start developing with Jesse is using VS Code Dev Containers. **No local installation required!**

#### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop) or Docker Engine
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

#### Steps
1. Clone the repository:
   ```sh
   # you can change "my-project" to any name you want
   git clone https://github.com/jesse-ai/project-template.git my-project
   cd my-project
   ```

2. Create your environment file:
   ```sh
   cp .env.example .env
   ```

3. Open the project in VS Code:
   ```sh
   code .
   ```

4. When prompted, click **"Reopen in Container"**
   - Or press `F1` and select "Dev Containers: Reopen in Container"

5. Wait for the containers to start (first time may take a few minutes)

6. Once ready, open [localhost:9000](http://localhost:9000) to see the dashboard!

**Benefits:**
- ✅ No Python or package installation needed on your machine
- ✅ Consistent development environment
- ✅ All dependencies pre-configured
- ✅ VS Code extensions automatically installed
- ✅ Isolated from your host system

[Learn more about the dev container setup](.devcontainer/README.md)

### Option 2: Traditional Docker Compose

Assuming that you already have installed the environment dependencies, you can run the following command to create your project:

```sh
# you can change "my-project" to any name you want
git clone https://github.com/jesse-ai/project-template.git my-project
# to create a .env file of yours
cp .env.example .env
```

Then while in the project run:

```sh
cd docker
docker-compose up
```

That's it! Now open [localhost:9000](http://localhost:9000) in your browser to see the dashboard. 