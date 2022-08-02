# Tools
- cairo-lang docker image: docker image which allows to run cairo commands from host in container and obtain resulting output files in host
- node: docker image which allows to run your own startknet node
- cairo-cmd image: docker image to execute commands inside. Run the container using `docker run -dit -v "$PWD":"$PWD" -w "$PWD" --name test cairo:cmd`
which will create a volume in the container containing files from the current working directory (PWD). Enter the container with `docker exec -it test /bin/sh`.
