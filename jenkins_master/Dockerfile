FROM jenkins/jenkins:2.173-alpine 
LABEL maintainer="danivy4@gmail.com"

ENV JAVA_OPTS="-Xmx2048m -Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

