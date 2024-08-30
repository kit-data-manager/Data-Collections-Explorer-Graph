# Data Collections Explorer Docker Container

This Docker container provides the graph-based version of the Data Collections Explorer.

## Set-up

To build and run the container, follow these steps:

- Build the container
```
$ docker build --force-rm -t dceng:v1 .
´´´
- Create required directories and set up the database
```
$ mkdir logs
$ mkdir -p databases/DB2
$ tdb2.tdbloader --loc databases/DB2 ../graph/DCE.ttl
´´´
- Start the container
```
$ sh startup.sh
´´´
