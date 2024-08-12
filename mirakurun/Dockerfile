FROM chinachu/mirakurun:latest

COPY softcas_linux.tar.gz /app
COPY softcas-install.sh /app
##
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get -y install git cmake pkg-config libpcsclite-dev

RUN /app/softcas-install.sh
