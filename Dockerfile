FROM debian:stable-slim

ADD get_install_openmpi.sh /usr/bin
RUN chmod +x /usr/bin/get_install_openmpi.sh
ADD get_build_install_deps.sh /usr/bin
RUN chmod +x /usr/bin/get_build_install_deps.sh
ADD get_default_gpt.sh /usr/bin
RUN chmod +x /usr/bin/get_default_gpt.sh

ADD README.rst /
ADD README.html /

RUN apt-get update
RUN apt-get install -y gcc cmake libmpfr-dev libgmp-dev git build-essential autoconf wget libssl-dev zlib1g-dev rpm python3 python3-pip bash

RUN pip3 install numpy notebook sphinx

VOLUME /install

VOLUME /notebooks
WORKDIR /

CMD python3 -m notebook --allow-root --ip=0.0.0.0 --port=8080 
