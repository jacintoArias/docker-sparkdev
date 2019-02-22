FROM openjdk:8u141-jdk

###################
# Installs scala 2.11
###################

RUN cd /opt/ && \
  wget https://downloads.lightbend.com/scala/2.11.11/scala-2.11.11.tgz -O scala-2.11.11.tgz && \
  tar -xvf scala-2.11.11.tgz && \
  rm scala-2.11.11.tgz

ENV PATH "$PATH:/opt/scala-2.11.11/bin"

###################
# Installs SBT
###################

ENV SBT_VERSION=1.1.1

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion


###################
# Installs Spark 2.3 
###################

ENV SPARK_HOME "/opt/spark"

RUN cd /opt/ && \
  wget  http://ftp.cixug.es/apache/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz -O spark-2.3.2-bin-hadoop2.7.tgz && \
  tar -xvf spark-2.3.2-bin-hadoop2.7.tgz && \
  rm spark-2.3.2-bin-hadoop2.7.tgz && \
  ln -s /opt/spark-2.3.2-bin-hadoop2.7/ $SPARK_HOME

ENV PATH "$PATH:$SPARK_HOME/bin"

COPY init-scripts/ /opt/init-scripts/

VOLUME /home/work/project 

WORKDIR /home/work/project

EXPOSE 8080
EXPOSE 10000
EXPOSE 8081
EXPOSE 7077
EXPOSE 4040

CMD ["spark-shell"]

