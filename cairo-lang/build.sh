docker build --network=host -f Dockerfile . -t cairo-lang
if [ ! -z "$1" ]
then
   docker tag cairo-lang:latest alphaticks/cairo-lang:$1
   docker push alphaticks/cairo-lang:$1
fi
