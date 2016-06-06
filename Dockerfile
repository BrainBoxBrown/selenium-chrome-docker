FROM ubuntu:14.04

MAINTAINER Jordan Brown

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
	python-pip \
	# phantomjs \
	chromium-browser \
	curl \
	unzip \
	xvfb

RUN curl "http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip" > chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod a+x chromedriver
RUN mv chromedriver /usr/bin

RUN mkdir /src
COPY . /src

RUN groupadd -r app && useradd -rm -g app app
RUN chown -R app:app /src
RUN chown app:app /usr/bin/chromedriver

RUN pip install -r /src/requirements.txt

# don't buffer thigns
ENV PYTHONUNBUFFERED 1

# Set up permissions so we don't run as root
USER app

# Set cwd where CMD executes
WORKDIR /src

ENTRYPOINT ["/src/browser.py"]
