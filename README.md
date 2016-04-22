#Webstorm Dockerized
Launch webstorm through a docker container.

## Requirement
1. Docker
2. Docker-compose
3. Need to be on Linux

## using docker-compose
1. Git clone
2. docker-compose up -d

If all went well, webstorm should launch. You'll either be asked to import webstorm settings or use the existing ones located in your home directory

## Potential issues
- If you run into an error, it's probably due to the user id assigned to 'developer' not matching your user id on the host. To resolve, run ls -lnah and see what user id is being used. Update the dockerfile with the user id and rebuild the docker image and run the container again.
- This is based on a Ubuntu host and will only work with systems using X11 and the socket being located in /tmp/.X11-unix. I am not too familiar with X11 and how other systems work. Ie, if you are on a mac, this will not work. 
 

## Todo
- Ability to easily load up your project files
- Ability to easily load up webstorm your keymap and configurations
- See how we can configure for Macs and other OS other than ubuntu using X.11