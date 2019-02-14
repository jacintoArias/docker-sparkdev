[![Docker Automated buil](https://img.shields.io/docker/automated/jacintoarias/docker-sparkdev.svg)](https://hub.docker.com/r/jacintoarias/docker-sparkdev/)
[![Docker Build Statu](https://img.shields.io/docker/build/jacintoarias/docker-sparkdev.svg)](https://hub.docker.com/r/jacintoarias/docker-sparkdev/)

# docker-sparkdev

This is a base base image for developing Apache Spark applications.

## Docker Hub

One can easily obtain the latest image using:

```
docker pull jacintoarias/docker-sparkdev:latest
```

There is a tagged for each spark version. Check the dockerhub repository.

## Usage

### Spark

Runs spark shell or any other spark program

```
docker run \
    --rm \
    -v $(pwd):/home/work/project \
    jacintoarias/docker-sparkdev \
    spark-shell
```

### Spark cluster

Deploy a single master/slave cluster:

```
docker-compose up
```

You can run jobs or interactive shells in this cluster by running:

```
docker-compose exec spark-master spark-shell --master spark://spark-master:7077
```

UIs are available at localhost. Be careful when navigating the UI links as they point to wrong hosts as they use the internal docker hostnames.

- Cluster UI http://localhost:8080
- Worker UI http://localhost:8081
- Driver Program UI http://localhost:4040

You can run spark applications from the host machine if you have spark available by binding to the dockerized cluster on localhost. Experiment with client and cluster modes to access the UI.

```
$SPARK_HOME/bin/spark-shell --master spark://localhost:7077
```

### SBT

The following command starts the sbt prompt, mounts your working directory as project root and builds the dependencies cache on the local `.ivy` folder.

```
docker run \
    --rm \
    -v $(pwd):/home/work/project \
    -v $(pwd)/.ivy:/sbtlib \
    jacintoarias/docker-sparkdev \
    sbt -Dsbt.global.staging=./.staging package \
    -ivy ./.ivy \
```

Runs an application within a jar file in your local sbt build

```
docker run \
    --rm \
    -v $(pwd):/home/work/project \
    jacintoarias/docker-sparkdev \
    spark-submit \
    --class <YOUR MAIN CLASS> \
    target/scala-2.11/<YOUR JAR FILE> \
    [ARGUMENTS]
```
