# Copy war to tomacat container####
FROM tomcat:10.0-jdk17
USER root

RUN apt-get update && apt-get install -y iptables

CMD iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080 && \
    catalina.sh run
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 80
