#!/bin/bash

# name of output file
: ${NAME:="backup"}

# By default we don't encrypt
: ${ENCRYPT:="no"}

# Set this to your encrypt password
: ${ENCRYPT_PASSWORD:="unset"}

# Set this to your list of tar exclude patterns
: ${EXCLUDE_PATTERN_FILE:="/dev/null"}
 
######################################

echo "HOME is ${HOME}"
echo "WHOAMI is `whoami`"

if [ "$1" = 'backup' ]; then
    echo "[Run] Starting backup"
    date

    if [ "${ENCRYPT_PASSWORD}" = "unset" ]; then
	echo "encryption password unset. aborting."
	exit 1
    fi

    outf=/working/"$NAME".tgz.enc
    working="$outf".partial
    echo "encrypted backup will be written to $outf"
    (cd /backup && tar -X "${EXCLUDE_PATTERN_FILE}" -cz ".") | openssl enc -aes-256-cbc -e -pass pass:"${ENCRYPT_PASSWORD}" > "$working" && mv "$working" "$outf" && /rotate-backups.py
    exit $?
fi

echo "[RUN]: Builtin command not provided [backup]"
echo "[RUN]: $@"

exec "$@"
