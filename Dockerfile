FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
rm -f /lib/systemd/system/multi-user.target.wants/;
rm -f /etc/systemd/system/.wants/;
rm -f /lib/systemd/system/local-fs.target.wants/;
rm -f /lib/systemd/system/sockets.target.wants/udev;
rm -f /lib/systemd/system/sockets.target.wants/initctl;
rm -f /lib/systemd/system/basic.target.wants/;
rm -f /lib/systemd/system/anaconda.target.wants/*;
ENV container docker
RUN yum update -y
RUN yum install httpd -y
RUN yum install initscripts -y
CMD chkconfig --levels 235 httpd on
ENTRYPOINT ["/usr/sbin/init"]
CMD ["systemctl httpd start"] 
COPY index.html /var/www/html/
EXPOSE 80
