FROM docker.io/centos/httpd-24-centos7

ADD src/.	 /var/www/html/

CMD run-httpd
