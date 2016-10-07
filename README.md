# salt-master
Salt master docker image

## Run salt-master

### Environment variables

* SALT_CONFIG_DIR=/data/config

The default value is `/data/config`. You will have to mount a volume here or you will lose your changes if you destroy the container.

* SALT_LOG_LEVEL=warning

### Availables volumes

* /data/config 

You can change the default config folder (`/etc/salt`) for the `salt-master` by using the
environment variable `SALT_CONFIG_DIR`.
Beware that you'll have to use the `-c /path/to/you/config/dir` with each salt commands.

* /var/log/salt
* /var/cache/salt

### Expose ports

If you want your `salt-master` container to be reachable from the outside, you will have to expose ports `4505` and `4506` which
are the `salt-master` default ports.

### Run salt-master

```
docker run -ti -d -e SALT_LOG_LEVEL=info -v $(pwd)/config:/etc/salt -p 4505:4505 -p 4506:4506 notuscloud/salt-master
```

## salt-ssh

You can use `salt-ssh` with this docker image by overriding the default command.
Update your `/etc/salt/roster` file then run: 

```
docker run -ti --rm -v $(pwd)/config:/etc/salt notuscloud/salt-master salt-ssh yourtarget -r "ls -al" 
```
