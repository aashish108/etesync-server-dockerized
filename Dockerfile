FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install git -qq
RUN apt-get install python3-pip -qq
RUN apt-get -y install sudo -qq
RUN sudo apt-get install python-virtualenv -qq
RUN git clone https://github.com/etesync/server-skeleton.git
RUN cd server-skeleton
RUN virtualenv -p python3 virtualenv
RUN virtualenv env
RUN source virtualenv/bin/activate
RUN cd ../
RUN git clone https://github.com/aashish108/etesync-server
RUN cd etesync-server && pip3 install -r requirements.txt 
RUN cd etesync-server && pwd && ./manage.py migrate && ./manage.py runserver 0.0.0.0:8000