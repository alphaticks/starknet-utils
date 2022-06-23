###Build the rust binaries###
FROM rust:1.61-bullseye AS rust-builder
RUN apt update
RUN apt install -y git
WORKDIR /usr/src
ARG PATHFINDER_VERSION
RUN git clone --branch ${PATHFINDER_VERSION} https://github.com/eqlabs/pathfinder.git 
WORKDIR /usr/src/pathfinder
RUN CARGO_INCREMENTAL=0 cargo build --release -p pathfinder --bin pathfinder

###Build the python libraries###
FROM python:3.8-slim-bullseye AS python-builder
#install gcc and gcc for required for pip packages
RUN apt update
RUN apt install -y libgmp-dev gcc && rm -rf /var/lib/apt/lists/*
COPY --from=rust-builder /usr/src/pathfinder/py /usr/src/pathfinder/py
WORKDIR /usr/src/pathfinder
RUN python3 -m pip --disable-pip-version-check install -r py/requirements-dev.txt

###Start the runner
FROM python:3.8-slim-bullseye AS python-runner
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y libgmp10 tini && rm -rf /var/lib/apt/lists/*
RUN groupadd --gid 1000 pathfinder && useradd --no-log-init --uid 1000 --gid pathfinder --no-create-home pathfinder

COPY --from=rust-builder /usr/src/pathfinder/target/release/pathfinder /usr/local/bin/pathfinder
COPY --from=python-builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

#Add /usr/share/pathfinder/data as linked to user and group 1000 (pathfinder)
RUN install --owner 1000 --group 1000 --mode 0755 -d /usr/share/pathfinder/data
ENV PATHFINDER_HTTP_RPC_ADDRESS="0.0.0.0:9545"

#Copy the entrypoint which allows to modify the ethereum.url arg used by pathfinder
COPY ./docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh

#switch user and group to 1000 before to launch the executable 
USER 1000:1000
EXPOSE 9545
WORKDIR /usr/share/pathfinder/data

#Run using a init made for containers (tini)
ENTRYPOINT ["/usr/bin/tini", "--", "sh", "/usr/bin/docker-entrypoint.sh"]

CMD []
