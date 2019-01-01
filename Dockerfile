FROM centos:7
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yum install epel-release -y && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && yum install composer cronie fping git httpd ImageMagick jwhois mtr MySQL-python net-snmp net-snmp-utils nmap php72w php72w-cli php72w-common php72w-curl php72w-gd php72w-mbstring php72w-mysqlnd php72w-process php72w-snmp php72w-xml php72w-zip python-memcached rrdtool -y
RUN useradd librenms -d /opt/librenms -M -r && usermod -a -G librenms apache && usermod -a -G apache librenms
COPY librenms.conf /etc/httpd/conf.d/librenms.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
VOLUME /opt
EXPOSE 80
CMD /docker-entrypoint.sh

