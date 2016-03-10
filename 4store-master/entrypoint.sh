#!/bin/bash

echo "[4s-boss]" > /etc/4store.conf
echo "discovery = default" >> /etc/4store.conf
echo "nodes = $STORE_NODES" >> /etc/4store.conf
4s-admin create-store default
4s-admin start-stores -a 
tail -f /dev/null
