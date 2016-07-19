#!/bin/bash

echo "[4s-boss]" > /etc/4store.conf
echo "discovery = default" >> /etc/4store.conf
echo "nodes = $STORE_NODES" >> /etc/4store.conf
tail -f /dev/null
