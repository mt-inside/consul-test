# From has to come first
FROM ubuntu:15.10

MAINTAINER Matt Turner <matturner@gmail.com>


RUN apt-get update && apt-get install -y \
  curl \
  unzip

RUN curl -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip > consul.zip
RUN unzip consul.zip
RUN rm consul.zip
RUN chmod +x consul

RUN mkdir /ui
RUN curl -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip > ui.zip
RUN unzip ui.zip -d ui


# REST and web UIs
EXPOSE 8500


#ENTRYPOINT /consul
CMD /consul agent -server -client=0.0.0.0 -bootstrap -data-dir /tmp -ui-dir /ui/dist
