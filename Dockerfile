FROM quay.io/centos7/httpd-24-centos7

ADD src/index.html /var/www/html/index.html

CMD run-httpd
