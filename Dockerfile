FROM centos7:latest
MAINTAINER Hama

RUN yum -y install httpd
RUN echo 'Hello, World!' > /var/www/html/index.html

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
