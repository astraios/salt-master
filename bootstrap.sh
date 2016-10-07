#!/bin/sh -x

SALT_LOG_LEVEL=${SALT_LOG_LEVEL:-warning}
SALT_CONFIG_DIR=${SALT_CONFIG_DIR:-/etc/salt}

# check /data/config
RESULT=$(ls -A ${SALT_CONFIG_DIR} | wc -l)
if [ ${RESULT} == "0" ];
then
  echo "CONFIG_DIR is empty, copying the default config files"
  cp -av /data/etc-template/* ${SALT_CONFIG_DIR%/}/.
fi

# Start salt-master
salt-master --config-dir=${SALT_CONFIG_DIR} --log-level=${SALT_LOG_LEVEL}
