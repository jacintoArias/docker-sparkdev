#!/bin/bash

$SPARK_HOME/sbin/start-slave.sh spark://spark-master:7077
# tail -f /opt/spark/logs/*