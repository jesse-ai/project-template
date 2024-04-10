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

## Usage on the command line

You can also run commands from the command line. For example, to run the backtest:

```sh
python test-strategy.py
```

For that to work, you need to have the environment dependencies installed. 
You can install them by running:

```sh
pip install -r requirements.txt
```
