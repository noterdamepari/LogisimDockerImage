FROM jlesage/baseimage-gui:alpine-3.19-v4

RUN apk add --no-cache \
    openjdk17-jre \
    libxext \
    libxrender \
    libxtst \
    libxi \
    ttf-dejavu \
    curl

RUN mkdir Logisim
WORKDIR /Logisim

RUN curl -L https://sourceforge.net/projects/circuit/files/2.7.x/2.7.1/logisim-generic-2.7.1.jar -o logisim.jar

COPY startapp.sh /startapp.sh

RUN set-cont-env APP_NAME "Logisim"

