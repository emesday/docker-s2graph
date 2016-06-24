FROM java:8

RUN \
  curl -fsL http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-2.11.7/bin:$PATH' >> /root/.bashrc

RUN \
  curl -L -o sbt-0.13.9.deb http://dl.bintray.com/sbt/debian/sbt-0.13.9.deb && \
  dpkg -i sbt-0.13.9.deb && \
  rm sbt-0.13.9.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

RUN (cd /opt && git clone https://github.com/apache/incubator-s2graph s2graph)
RUN (cd /opt/s2graph && sbt package)

ADD entrypoint.sh /opt

CMD "/opt/entrypoint.sh"

