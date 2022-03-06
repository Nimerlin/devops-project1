FROM httpd:2.4
COPY index.html /var/www/html/
ENTRYPOINT /etc/init.d/httpd CMD start
CMD ["service" "httpd" "start"]
EXPOSE 80
