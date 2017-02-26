running the containers
======================

### run once  
	- without simulations: `docker run azathoth/gazebo:only-repository`  
	- with simulations:	    `docker run azathoth/gazebo:with-simulations`

### run as guest OS
	`docker run -it azathoth/gazebo:only-repository`

### run as guest OS with shared desktop via vnc:
	`docker run -p 5900 gazebo:with-vnc-gui x11vnc -forever -usepw -create`

connect to running container:
	docker attach [id]

connect to running container and create new shell:
	docker exec -it [id] bash


how to run simulation:
	start ros container by:
		docker run -p 5900 gazebo:with-vnc-gui x11vnc -forever -usepw -create
	in another cmd window, get its id by:
		docker ps
	run
		docker exec -it [id] bash
	in this window



developing:

before building: 
	in this repository, you need to have 2 text files:
		id_rsa
			to this file, put a private ssh key to clone private github repository
		rsync_pass
			to this file, put a password to downlod mbzirc repo
build:
	only repository:
		docker build -f ./only-repository/Dockerfile -t gazebo:only-repository .
	repository with simulations:
		docker build -f ./with-simulations/Dockerfile -t gazebo:with-simulations .

tag to azathoth user:
	docker tag gazebo:only-repository azathoth/gazebo:only-repository
	docker tag gazebo:with-simulations azathoth/gazebo:with-simulations

push:
	only repository:
		docker push azathoth/gazebo:only-repository
	repository with simulations:
		docker push azathoth/gazebo:with-simulations

