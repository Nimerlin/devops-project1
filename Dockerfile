FROM centos/systemd
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);  
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
CMD ["/usr/sbin/init"]
COPY index.html /var/www/html/
EXPOSE 80




