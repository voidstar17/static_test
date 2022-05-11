FROM docker.io/centos/httpd-24-centos7

USER 0
ADD src/.	 /var/www/html/
RUN chown -R 1001:0 /var/www/html

USER 1001
CMD run-httpd
