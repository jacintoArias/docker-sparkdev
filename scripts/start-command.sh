#!/bin/bash

docker-compose exec spark-master /opt/spark/bin/${1:-spark-submit} --master spark://spark-master:7077