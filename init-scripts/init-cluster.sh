#!/bin/bash

/opt/init-scripts/init-master.sh
/opt/init-scripts/init-slave.sh
tail -f /opt/spark/logs/*