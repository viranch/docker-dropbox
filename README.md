[![Docker Pulls](https://img.shields.io/docker/pulls/viranch/dropbox.svg?maxAge=604800)](https://hub.docker.com/r/viranch/dropbox/) [![Docker Stars](https://img.shields.io/docker/stars/viranch/dropbox.svg?maxAge=604800)](https://hub.docker.com/r/viranch/dropbox/) [![Layers](https://images.microbadger.com/badges/image/viranch/dropbox.svg)](https://hub.docker.com/r/viranch/dropbox/)

# docker-dropbox
Just a dumb Apache server for hosting random files

### How to use?

- Install [docker](https://docs.docker.com/installation/#installation).

- Run the container:
```
docker run -d --name share -v $PWD/data:/data -p 80:80 ghcr.io/viranch/dropbox
```

- [OPTIONAL] Data directory name for the URL defaults to "d" which can be customized with the `DATA_DIR_NAME` env var (this does not affect the actual directory name, only the URI that points to it):
```
docker run [...] -e DATA_DIR_NAME=media ghcr.io/viranch/dropbox
```

- [OPTIONAL] To protect your container, you can set a username & password for basic authentication, using the `AUTH_USER` & `AUTH_PASS` environment variables:
```
docker run [...] -e AUTH_USER=bob -e AUTH_PASS=myprecious [...] ghcr.io/viranch/dropbox
```

- Navigate to `http://your-ip/$DATA_DIR_NAME`. You can change the port with the `-p` switch, eg: `-p 8000:80`.
