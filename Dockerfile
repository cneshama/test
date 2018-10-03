FROM centos7:latest
MAINTAINER Hama

RUN yum -y install httpd
RUN echo 'Hello, World!' > /var/www/html/index.html

RUN chmod 777 /etc/httpd/logs
RUN chmod 777 /etc/httpd/modules
RUN chmod 777 /etc/httpd/run

RUN sed -ie 's/80/10080/' /etc/httpd/conf/httpd.conf
RUN sed -ie '$a ServerName localhost' /etc/httpd/conf/httpd.conf

EXPOSE 10080
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
