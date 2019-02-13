[![Docker Automated buil](https://img.shields.io/docker/automated/enriquegrodrigo/docker-sparkdev.svg)](https://hub.docker.com/r/enriquegrodrigo/docker-sparkdev/)
[![Docker Build Statu](https://img.shields.io/docker/build/enriquegrodrigo/docker-sparkdev.svg)](https://hub.docker.com/r/enriquegrodrigo/docker-sparkdev/)

# docker-sparkdev

This is a base base image for developing Apache Spark applications. 

## Docker Hub

One can easily obtain the latest image using:
```
docker pull jacintoarias/docker-sparkdev:latest
```

## Usage

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


### Spark

Runs an application withing a jar file in your local sbt build

```
docker run \
    --rm \
    -v $(pwd):/home/work/project \
    jacintoarias/docker-sparkdev \
    spark-submit \
    --class <YOUR MAIN CLASS> \
    target/scala-2.11/<YOUR JAR FILE> \
    <ARGUMENTS>
```

Runs spark shell or any other program

```
docker run \
    --rm \
    -v $(pwd):/home/work/project \
    jacintoarias/docker-sparkdev \
    spark-shell
```
