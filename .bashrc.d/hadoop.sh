#!/bin/bash

options=(
    '-Djava.security.krb5.realm='
    '-Djava.security.krb5.kdc='
    '-Djava.security.krb5.conf=/dev/null'
)

export HADOOP_OPTS="${options[*]}"
