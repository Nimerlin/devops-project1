FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY index.html /var/www/html/

CMD [“/usr/sbin/httpd”,” -D”,” FOREGROUND”]
EXPOSE 80
