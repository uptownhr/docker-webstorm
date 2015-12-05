#Webstorm Dockerized
Launch webstorm through a docker container.

## How to use
1. Git clone
2. docker build -t webstorm .
3. docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix webstorm

If all went well, webstorm should launch. 

## Potential issues
- If you run into an error, it's probably due to the user id assigned to 'developer' not matching your user id on the host. To resolve, run ls -lnah and see what user id is being used. Update the dockerfile with the user id and rebuild the docker image and run the container again.
- This is based on a Ubuntu host and will only work with systems using X11 and the socket being located in /tmp/.X11-unix. I am not too familiar with X11 and how other systems work. Ie, if you are on a mac, this will not work. 
 

## Todo
- Ability to easily load up your project files
- Ability to easily load up webstorm your keymap and configurations
- See how we can configure for Macs and other OS other than ubuntu using X.11