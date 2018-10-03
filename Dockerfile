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

RUN cp -p /usr/lib64/httpd/modules/* /tmp/modules/
RUN cp -rp /run/httpd/ /tmp/run/

RUN chmod 777 /run/httpd
RUN chmod 777 /etc/httpd/logs
RUN chmod 777 /etc/httpd/modules
RUN chmod 777 /etc/httpd/run

RUN sed -ie 's/RUN sed -ie 's/\#ServerName/ServerName/' /etc/httpd/conf/httpd.conf
RUN sed -ie 's/RUN sed -ie 's/www.example.com:80/localhost/' /etc/httpd/conf/httpd.conf
RUN sed -ie 's/80/10080/' /etc/httpd/conf/httpd.conf

EXPOSE 10080
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
