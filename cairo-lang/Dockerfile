FROM python:3.7-slim-bullseye AS main
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y tini
RUN apt install -y libgmp3-dev build-essential
RUN python -m pip install ecdsa fastecdsa sympy cairo-lang

COPY entrypoint.sh /usr/local/bin/
COPY host.patch /usr/local/lib/python3.7/site-packages/starkware/cairo/lang/tracer
WORKDIR /usr/local/lib/python3.7/site-packages/starkware/cairo/lang/tracer
RUN patch tracer.py host.patch
RUN rm host.patch
WORKDIR /
ENTRYPOINT ["/usr/bin/tini", "--", "sh", "/usr/local/bin/entrypoint.sh"]