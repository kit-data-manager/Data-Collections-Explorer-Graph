#!/bin/sh

# Licensed under the terms of the MIT License.

docker run -d -it -p 3030:3030 \
	--name DCENG \
	--restart unless-stopped \
	--mount type=bind,source="$(pwd)"/databases,target=/fuseki/databases \
	--mount type=bind,source="$(pwd)"/logs,target=/fuseki/logs \
	-t dceng \
	--tdb2 --loc databases/DB2 /graph
