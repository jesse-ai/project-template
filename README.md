# Jesse Project Template

This is template from which you can create your own Jesse project.

## Usage
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

## AI assistants (MCP)

Jesse serves MCP at your dashboard address plus `/mcp`, which is `http://localhost:9000/mcp` by default. Assistants must send `Authorization: Bearer <token>`, where the token is derived from the `PASSWORD` in your `.env`. See [MCP server setup](https://docs.jesse.trade/docs/mcp/setup) to create the token and connect your assistant.

## Using Jesse from another computer

To open the dashboard or connect an assistant from another computer, set `DASHBOARD_URL` in `.env` to the address you use to reach this machine, for example `DASHBOARD_URL=http://192.168.1.20:9000`, then restart Jesse. MCP is then available at `http://192.168.1.20:9000/mcp`. Change `PASSWORD` from the example value before making Jesse reachable over a network. See [Configuration](https://docs.jesse.trade/docs/configuration#environment-variables) for the details.
