# salt-master
Salt master docker image

## Run salt-master

### Environment variables

* SALT_CONFIG_DIR=/data/config
The default value is `/data/config`. You will have to mount a volume here or you will lose your changes if you destroy the container

* SALT_LOG_LEVEL=warning

### Availables volumes

* /data/config 
* /var/log/salt
* /var/cache/salt

### Expose ports

If you want your `salt-master` container to be reachable from outside, you'll have to expose ports `4505` and `4506` which
are the `salt-master` default ports

### Run salt-master

```
docker run -ti -d -e SALT_LOG_LEVEL=info -v $(pwd)/config:/data/config -p 4505:4505 -p 4506:4506 notuscloud/salt-master
```
