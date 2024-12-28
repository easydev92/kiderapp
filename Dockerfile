# Base Image 
FROM httpd:2.4-alpine

#Copy the index.html file /usr/local/apache2/htdocs/
COPY . /usr/local/apache2/htdocs/

#Expose Apache Port
EXPOSE 80
