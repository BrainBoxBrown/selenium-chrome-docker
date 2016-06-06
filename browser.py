#!/usr/bin/python

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from pyvirtualdisplay import Display
import time
import os 

url = "https://www.google.com"

display = Display(visible=0, size=(800, 800))  
display.start()
driver = webdriver.Chrome()

# Phantomjs refused to work
#driver = webdriver.PhantomJS(service_log_path=os.path.devnull) 
driver.get(url)

# Do whatever you want here

print driver.title


driver.close()
