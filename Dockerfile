#
# Aerospike Java Client 
#
# http://github.com/volmarl/aerospike-client-java.docker
#

FROM ubuntu:xenial 


# Work from /aerospike
WORKDIR /aerospike


ENV PATH /aerospike:$PATH


RUN \
  apt-get update -y \
  && apt-get install -y python wget logrotate ca-certificates python-dev python-setuptools python-argparse python-bcrypt openssl python-openssl  

COPY as_java_client.sh /tmp/as_java_client.sh

RUN /tmp/as_java_client.sh  


# Wrapper script entrypoint
ENTRYPOINT ["bash"]
