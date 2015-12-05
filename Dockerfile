FROM ubuntu:14.04

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

RUN apt-get update
RUN sudo apt-get install wget zenity default-jre default-jdk -y

WORKDIR /home/developer
USER developer
ENV HOME /home/developer

RUN wget http://download.jetbrains.com/webstorm/WebStorm-11.0.1.tar.gz
RUN tar -zxvf WebStorm-11.0.1.tar.gz

CMD /home/developer/WebStorm-143.382.36/bin/webstorm.sh

