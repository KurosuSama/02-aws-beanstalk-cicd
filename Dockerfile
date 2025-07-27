# Copy war to tomacat container####
FROM tomcat:10.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 80
