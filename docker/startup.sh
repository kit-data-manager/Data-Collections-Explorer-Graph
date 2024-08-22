#!/bin/sh

# Licensed under the terms of the MIT License.

docker run -d -it -p 3030:3030 \
	--name DCENG \
	--mount type=bind,source="$(pwd)"/databases,target=/fuseki/databases \
	--mount type=bind,source="$(pwd)"/logs,target=/fuseki/logs \
	--restart unless-stopped \
	dceng:v1
