#!/bin/bash

if [[ -n "$AUTH_USER" ]]; then
    echo $AUTH_PASS | htpasswd -ic /etc/apache2/htpasswd $AUTH_USER
    cat << EOF > /etc/apache2/conf-enabled/auth.conf
# protect directory listing & reverse proxy requests with basic auth
<Location />
    AuthType Basic
    AuthName "By Invitation Only"
    AuthUserFile /etc/apache2/htpasswd
    Require valid-user
</Location>

# don't enforce auth on files for download convenience
<LocationMatch /d/.*[^/]$>
    Require all granted
</LocationMatch>
EOF
fi

mkdir -p /data
test -L /var/www/html/d || ln -s /data /var/www/html/d

exec "$@"
