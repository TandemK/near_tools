FROM ubuntu:latest

ENV NETWORK=mainnet

RUN ln -snf /usr/share/zoneinfo/GMT /etc/localtime && echo GMT > /etc/timezone
RUN apt update; apt install -y screen awscli
ADD  https://raw.githubusercontent.com/TandemK/near_tools/main/dwl.sh /bin/
RUN /usr/bin/chmod +x /bin/dwl.sh
WORKDIR /opt/near/dwl

CMD  ["/bin/dwl.sh"]
