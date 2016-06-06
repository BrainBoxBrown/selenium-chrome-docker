# selenium-chrome-docker
Docker container that runs chrome via selenium using python

Assuming you have docker installed and running

```
git clone https://github.com/BrainBoxBrown/selenium-chrome-docker.git 
cd selenium-chrome-docker
```

Edit browser.py to do whatever you want to do and the run
the following 

```
sudo docker build -t brainbox/selenium-phantomjs .
sudo docker run -d --name selenium brainbox/selenium-phantomjs
```


