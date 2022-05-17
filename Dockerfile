FROM docker.io/centos/httpd-24-centos7

ADD src/.	 /var/www/html/

RUN mkdir -p /opt/app-root/httpd-ssl/certs/ /opt/app-root/httpd-ssl/private/ && \
openssl genrsa -des3 -passout pass:x -out /opt/app-root/httpd-ssl/private/server.pass.key 2048 && \
openssl rsa -passin pass:x -in /opt/app-root/httpd-ssl/private/server.pass.key -out /opt/app-root/httpd-ssl/private/server-key.pem && \
openssl req -new -key /opt/app-root/httpd-ssl/private/server-key.pem -out /opt/app-root/httpd-ssl/private/server.csr -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=bun.com" && \
openssl x509 -req -days 365 -in /opt/app-root/httpd-ssl/private/server.csr -signkey /opt/app-root/httpd-ssl/private/server-key.pem -out /opt/app-root/httpd-ssl/certs/server-cert-selfsigned.pem

CMD run-httpd
