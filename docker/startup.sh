#!/bin/sh

# Licensed under the terms of the MIT License.

# Create required directories if missing
for dir in backup data logs
do
	mkdir -p docker/$dir 2>/dev/null || true
done

docker run -d -it -p 3030:3030 \
	--name DCENG \
	--mount type=bind,source="$(pwd)"/docker/backup,target=/fuseki-base/backup \
	--mount type=bind,source="$(pwd)"/docker/config,target=/fuseki-base/configuration \
	--mount type=bind,source="$(pwd)"/docker/data,target=/fuseki-base/databases \
	--mount type=bind,source="$(pwd)"/docker/logs,target=/fuseki-base/logs \
	--restart unless-stopped \
	dceng:v1
