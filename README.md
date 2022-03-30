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