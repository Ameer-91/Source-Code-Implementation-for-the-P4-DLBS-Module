#!/bin/bash
set -e
echo "Compiling p4_dlbs.p4..."
p4c-bm2-ss --target bmv2 --arch v1model --p4runtime-files build/p4_dlbs.p4info.txt -o build/p4_dlbs.json p4dlbs/p4_dlbs.p4

echo "Launching Mininet topology..."
sudo python3 topology/topology_dlbs.py &
sleep 5

echo "Starting controller..."
python3 controller/controller_dlbs.py
