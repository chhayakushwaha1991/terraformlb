#!/bin/bash
sudo yum update -y
sudo yum install java-openjdk -y
curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz
tar -xzvf apache-tomcat-8.5.82.tar.gz
sudo curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
sudo curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
sudo mv mysql-connector.jar apache-tomcat-8.5.82/lib
sudo mv student.war apache-tomcat-8.5.82/webapps
cd apache-tomcat-8.5.82/bin/
sudo ./catalina.sh start
