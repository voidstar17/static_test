FROM docker.io/centos/httpd-24-centos7

USER 0
ADD src/.	 /var/www/html/
RUN chown -R 1001:0 /var/www/html

USER 1001
# Let the assemble script install the dependencies
RUN /usr/libexec/s2i/assemble

# The run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
