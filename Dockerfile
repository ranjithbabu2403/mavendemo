FROM tomcat:9.0
LABEL maintainer="Ranjith"

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file (this will be created by Jenkins)
COPY mavendemo.war /usr/local/tomcat/webapps/

EXPOSE 8080
