FROM $registry/elqjdk.el6:1.8.77
MAINTAINER nikolas.karavias@oracle.com

RUN yum install tar -y && yum clean all

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
ENV ZK_VERSION 3.4.8
ENV ZK_USR_HOME /home/zookeeper
ENV ZK_HOME /opt/zookeeper

RUN curl -o /tmp/zk.tar.gz http://archive.apache.org/dist/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz && \
  cd /opt && \
  mkdir $ZK_HOME && \
  tar xf /tmp/zk.tar.gz -C $ZK_HOME --strip-components=1 && \
  rm -rf /tmp/zk.tar.gz

RUN useradd zookeeper && chown -R zookeeper: $ZK_HOME

ADD conf/zoo.cfg $ZK_HOME/conf/
ADD bin/zookeeper /zookeeper

VOLUME [ "/data", "/log" ]

EXPOSE 2181 2888 3888

CMD ["/zookeeper"]
