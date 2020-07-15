FROM ubuntu:xenial

# Download & install apache
RUN apt-get update; \
    apt-get install -y --no-install-recommends apache2 apache2-bin; \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Setup apache
COPY assets/config/apache2 /etc/apache2/conf-enabled/
COPY assets/apaxy/ /var/www/html/

# Add required startup scripts
COPY assets/scripts/ /opt/scripts/

# Finally declare public things
VOLUME /data
EXPOSE 80

# Define how to run the image
ENTRYPOINT ["/opt/scripts/start.sh"]
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
