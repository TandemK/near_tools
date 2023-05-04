FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/GMT /etc/localtime && echo GMT > /etc/timezone
RUN apt update; apt install -y screen awscli
