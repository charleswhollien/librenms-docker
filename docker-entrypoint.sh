#!/bin/bash
set -x
function updateperms(){
while true
do
  if [ ! -f /opt/librenms/config.php ] 
  then
    sleep 10
  else
  chown -R librenms:librenms /opt/librenms
  chmod -R ug=rwX /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
  exit 0
  fi	  
done	  
}

if [ ! -d /opt/librenms ]
then
  sed -i "s/^;date.timezone =/date.timezone= \"America\/New_York\"/" /etc/php.ini
  chown apache:apache -R /opt
  cd /opt/
  su -s /bin/bash -c "composer create-project --no-dev --keep-vcs librenms/librenms librenms dev-master" apache
  updateperms &
fi
httpd -DFOREGROUND

