FROM python:3.7-alpine AS main
RUN apk update 
RUN apk add gcc musl-dev gmp-dev 
RUN python -m pip install ecdsa fastecdsa sympy cairo-lang

FROM python:3.7-alpine AS runner
COPY --from=main /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages/
COPY --from=main /usr/lib/libgmp* /usr/lib/
COPY --from=main /usr/local/bin/cairo-* /usr/local/bin/
COPY --from=main /usr/local/bin/starknet* /usr/local/bin/
RUN apk update && DEBIAN_FRONTEND=noninteractive apk add patch gcc musl-dev gmp-dev

CMD ["/bin/sh"]