#!/bin/bash

cd /opt/s2graph/target/s2graph-*-bin
./bin/start-s2graph.sh

tail -f logs/application.log
