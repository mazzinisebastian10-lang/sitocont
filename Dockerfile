FROM tomcat:9.0

# Rimuove applicazioni di default
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia il tuo file war
COPY mioSito.war /usr/local/tomcat/webapps/ROOT.war

# Porta dinamica per Render
CMD sed -i "s/8080/${PORT}/" /usr/local/tomcat/conf/server.xml && catalina.sh run
