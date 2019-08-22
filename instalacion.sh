#! /bin/bash
virtualenv -p /usr/bin/python env
source env/bin/activate
pip3 install -r requirements.txt
django-admin starproject projectfacilito
django-admin startapp book

npm install -g @vue/cli-init 
npm install bootstrap-vue


#https://www.youtube.com/watch?v=Vpwzi1260fg&list=PLpOqH6AE0tNh7-Z-Lka9e0hRA2OdNB0dx&index=10
