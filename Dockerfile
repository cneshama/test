FROM centos7:latest
MAINTAINER Hama

RUN yum -y install httpd
RUN echo 'Hello, World!' > /var/www/html/index.html

RUN rm -f /etc/httpd/logs
RUN rm -f /etc/httpd/modules
RUN rm -f /etc/httpd/run

RUN mkdir /tmp/logs
RUN mkdir /tmp/modules
RUN mkdir /tmp/run

RUN ln -s /tmp/logs /etc/httpd/logs
RUN ln -s /tmp/modules /etc/httpd/modules 
RUN ln -s /tmp/run /etc/httpd/run

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
