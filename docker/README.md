# Data Collections Explorer Docker Container

This Docker container provides the graph-based version of the Data Collections Explorer.

## Set-up

To build and run the container, follow these steps:

- Build the container
```
$ docker build --force-rm -t dceng:v1 .
```
- Create required directories and set up the database
```
$ mkdir logs
$ mkdir -p databases/DB2
$ tdb2.tdbloader --loc databases/DB2 ../graph/DCE.ttl
```
- Start the container
```
$ sh startup.sh
```
The SPARQL endpoint is accessible at `localhost:3030/graph`.

## License information

The following files have been adapted from the official [Apache Jena Fuseki Docker Tools](https://github.com/apache/jena/tree/main/jena-fuseki2/jena-fuseki-docker) and are licensed under the Apache 2.0 License:
- Dockerfile
- assembly-docker.xml
- docker-compose.yaml
- download.sh
- entrypoint.sh
- log4j2.properties
- pom.xml
