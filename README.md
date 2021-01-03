# django-docker-install

Docker-ready Spirit/Django Application

# Project Information: 

This application uses:

	•Django
	
	•nitely/Spirit, a Python based forum built using the Django framework. For further information: https://spirit.readthedocs.io/en/latest/
	
	•Docker, a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. For further information: https://docs.docker.com/
	
	•NGINX, a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. For further information: https://docs.nginx.com/
	
	•gunicorn, a Python WSGI HTTP Server for UNIX. For further information: https://docs.gunicorn.org/en/stable/
	
	•Bash,  a Unix shell and command language. For further information: https://devdocs.io/bash/
	



# Installation & Run 

Make sure internet connection is available.
Works on Ubuntu 20.04 LTS, (Tested on Microsoft Azure & Amazon EC2 virtual machines)

First of all Run sudo apt update

Make sure Git works. If not , run sudo apt install git 

Clone the main repository from GitHub:

Run:

	   git clone https://github.com/merto-dvp/spirit-docker-v2

Navigate to folder spirit-docker-v2/app:

Run:

	cd spirit-docker-v2/app
	
Run install_script.sh to start:

	sudo bash install_script.sh

Wait until script loads everything. If docker hello-world app works, App folder & Docker are ready to serve.

This will run another script  spirit_install_app_script.sh .

This script asks for your permission to install default project hosted on GitHub repo.

 

This project is made with default installation guide: https://github.com/nitely/Spirit

	pip install django-spirit
	spirit startproject mysite
	cd mysite
	python manage.py spiritinstall
	python manage.py createsuperuser
	python manage.py runserver

It is hosted on GitHub: https://github.com/merto-dvp/django-spirit-ready-app

Project name will be set to mysite. App folder is configured to run mysite project as default.

Run sudo docker-compose run web python3 manage.py createsuperuser for creating an admin account.

After running this script, it is going to run Docker configurations and serve the application at 0.0.0.0:8000.


If you don’t want to install default project, you can skip this by (N n) or Ctrl-C.

Run project once with:

	docker-compose up
or

	sudo docker-compose run web python3 manage.py migrate
	
for initilazing Docker & Database.


# For Creating Admin Account, You can run:

	sudo docker-compose run web python3 manage.py createsuperuser 



# Manual Installation

If you don’t want to install default project, you can run this script. But you have to configure the project by yourself. Use sudo if you get permission denied or related errors.

Script: 

	sudo bash manual_install_script.sh

This script will clean up & config the app folder. Then will install default Spirit/Django app with SQLite3 database and default settings. It will run default installation guide instructions to build up project. https://github.com/nitely/Spirit.

After running script it will ask you to choose a project folder name for creating app.

 

After successful creation and setting folders,

 


Now you have to configure Docker & Spirit app.

For changing database and using advantages of app/env.dev file (ALLOWED_HOSTS,DEBUG,SECRET_KEY),change settings in projects settings folder.

For changing it, go to your (Django/Spirit) project folder (mysite for default)

	project_folder/settings/dev.py

And use a text editor to edit dev.py. (Use sudo if required)

 


For using env.dev, import os package by adding 

	import os

to dev.py.



After that, overwrite DEBUG=True to :

	DEBUG = int(os.environ.get("DEBUG", default=0))

Overwrite SECRET_KEY = "DEV" to :

	SECRET_KEY = os.environ.get("SECRET_KEY")

Overwrite ALLOWED_HOSTS = ['127.0.0.1', ] to :

	ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS").split(" ")


 

This is also required for avoiding DisallowedHost message. But you have to make sure env.dev file is ready.


For changing database :


Overwrite default DATABASE settings :

	DATABASES = {
	    'default': {
		'ENGINE': 'django.db.backends.sqlite3',
		'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
	    }
	}
to:

	DATABASES = {
	    'default_old': {
		'ENGINE': 'django.db.backends.sqlite3',
		'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
	    },
	    'default': {
		'ENGINE': 'django.db.backends.postgresql',
		'NAME': 'postgres',
		'USER': 'postgres',
		'PASSWORD': 'postgres',
		'HOST': 'db',
		'PORT': 5432,
	    }
	}


Now you can use PostgreSQL.

After overwriting all, save base.py and go back to project root folder. ( cd .. )

Edit env.dev file with a text editor.

You can change 

	DEBUG=1 ( For enabling debug )
	SECRET_KEY=j_o)qybin6wd60ph#z=iuuzhb7h45w8+sf6_$3iaz22^obifrl
	DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1] * 0.0.0.0

settings easily in this file.

 

After changing settings and using with Docker, you also need to change NGINX and gunicorn settings. Because for default, they're set to work with 
mysite project folder name.

For NGINX settings:

	cd config/nginx/
	sudo nano nginx.conf

For gunicorn settings:

For running app you need to configure gunicorn settings. Edit app/docker-compose.yml with a text editor:

Change & overwrite gunicorn mysite.wsgi to:

	gunicorn <project_name>.wsgi


	command: bash -c "python manage.py makemigrations && python manage.py migrate && gunicorn <project_name>.wsgi -b 0.0.0.0:8000"
	
	
 

You can configure Docker-compose settings here.
After all, simply run after_settings_script.sh :

	bash after_settings_script.sh

This will configure Docker containers again and will serve the application.
Also you can run the <docker-compose up> command to serve application at any time.


# Congratulations, your app works at http://<IP_address>:8000 !


 

