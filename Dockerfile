# Use the official CentOS 7.9.2009 base image
FROM centos:7.9.2009

# Update the package manager and install necessary packages
RUN yum -y update && \
    yum -y install epel-release httpd mod_ssl dnf yum-utils policycoreutils-python && \
    yum -y install postgresql-server postgresql-contrib && \
    yum -y install java-11-openjdk-devel && \
    yum clean all

# Add PostgreSQL repository and install PostgreSQL
RUN yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm && \
    yum-config-manager --enable pgdg12 && \
    yum -y install postgresql12-server postgresql12 && \
    yum clean all

# Start Apache HTTP server, enable it to start on system boot, and configure a ServerName directive
RUN systemctl enable httpd && \
    echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

# Check if the tomcat group already exists before creating it
RUN getent group tomcat || groupadd -rf tomcat

# Check if the tomcat user already exists before creating it
RUN id -u tomcat &>/dev/null || \
    useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

# Expose ports 80 (HTTP) and 5432 (PostgreSQL) to the outside world
EXPOSE 80 5432

# Set the default command to start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]





