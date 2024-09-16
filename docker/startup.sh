#!/usr/bin/env sh

# Licensed under the terms of the MIT License.

# Check whether an old dceng-based container is still around and get its ID
CONTAINER=$(docker container ls -a | awk '$2 ~ /^dceng$/ { print $1 }')

# Stop old running container and remove it
if [ $CONTAINER ]; then
	docker container stop $CONTAINER;
	docker container rm $CONTAINER;
fi

# Create a new container
docker run -d -it -p 3030:3030 \
	--name DCENG \
	--restart unless-stopped \
	--mount type=bind,source="$(pwd)"/databases,target=/fuseki/databases \
	--mount type=bind,source="$(pwd)"/logs,target=/fuseki/logs \
	-t dceng \
	--tdb2 --loc databases /dce
