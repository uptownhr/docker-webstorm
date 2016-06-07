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

## MAC / OSX
As Docker currently does not natively run on osx, you cannot volumize the x11 socket and must perform a few steps to work around this. 

In osx, we will be forward x11 to a tcp socat service that will redirect to xquarz.

### Steps
1. brew install socat   
2. brew cask install xquartz
3. open -a XQuartz
4. open xQuartz `preference` and modify `security` setting to `allow connections network clients`
6. socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
7. edit environment variable DISPLAY in docker-cmopose.yml to your IP address with :0. Will look something like `- DISPLAY=192.168.1.11:0` You need to replace 192.168.1.11 with your hosts ip address. look for en0 ip address on `ifconfig`
8. docker-compose up
 

## Todo
- [x] Ability to easily load up your project files
- [x] Ability to easily load up webstorm your keymap and configurations
- [x] See how we can configure for Macs and other OS other than ubuntu using X.11
