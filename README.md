[![Docker Pulls](https://img.shields.io/docker/pulls/viranch/dropbox.svg?maxAge=604800)](https://hub.docker.com/r/viranch/dropbox/) [![Docker Stars](https://img.shields.io/docker/stars/viranch/dropbox.svg?maxAge=604800)](https://hub.docker.com/r/viranch/dropbox/) [![Layers](https://images.microbadger.com/badges/image/viranch/dropbox.svg)](https://hub.docker.com/r/viranch/dropbox/)

# docker-dropbox
Just a dumb Apache server for hosting random files

### How to use?

- Get a VPS or a [RaspberryPi](http://www.raspberrypi.org/) and install any Linux OS (preferably, with a good docker support; choose one of Ubuntu & ArchLinux if in doubt).

- Install [docker](https://docs.docker.com/installation/#installation) on it.

- Run the container:
```
docker run -d --name share -v $PWD/data:/data -p 80:80 viranch/dropbox
```

- [OPTIONAL] To protect your container, you can set a username & password for basic authentication, using the `AUTH_USER` & `AUTH_PASS` environment variables:
```
docker run [...] -e AUTH_USER=bob -e AUTH_PASS=myprecious [...] viranch/dropbox
```

- Navigate to `http://your-ip/`. You can change the port with the `-p` switch, eg: `-p 8000:80`.
