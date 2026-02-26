FROM tomcat9.0

# Rimuove applicazioni di default
RUN rm -rf usrlocaltomcatwebapps

# Copia tutti i file del progetto dentro ROOT
COPY . usrlocaltomcatwebappsROOT

# Configurazione porta dinamica per Render
CMD sed -i s8080${PORT} usrlocaltomcatconfserver.xml && catalina.sh run
