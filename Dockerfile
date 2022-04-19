FROM quay.io/centos7/httpd-24-centos7

ADD src/ /var/www/html/

CMD run-httpd
