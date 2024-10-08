# Data Collections Explorer Docker Container

This Docker container provides the graph-based version of the Data Collections Explorer.

## Set-up

To build and run the container, follow these steps:

- Build the container
```
$ docker build --force-rm -t dce .
```
- Create required directories and set up the database
```
$ mkdir logs
$ mkdir -p databases/DB2
$ tdb2.tdbloader --loc databases/DB2 ../graph/DCE.ttl
```
`tdb2.tdbloader` is part of the [Apache Jena Command Line Tools](https://jena.apache.org/documentation//tdb2/tdb2_cmds.html),
available as part of the [Apache Jena Commands](https://jena.apache.org/download/index.cgi)
distribution.
- Start the container
```
$ sh startup.sh
```
The SPARQL endpoint is accessible at `localhost:3030/dce`. Queries are
logged to `logs/fuseki.log`.

## Queries

The SPARQL endpoint can be queried using tools such as [curl](https://curl.se),
i.e., use the following command to send queries to a local instance:
```
curl -H "Accept: application/sparql-results+json" -G "localhost:3030/dce" --data-urlencode 'query@query.sprq'
```
or the following command to query the endpoint at ```data-collections.nfdi4ing.de/dce```:
```
curl -H "Accept: application/sparql-results+json" -G "https://data-collections.nfdi4ing.de/dce" --data-urlencode 'query@query.sprq'
```
Here, `query.sprq` is a file containing the actual query. Results will be returned
in JSON format; XML output is possible as well, in this case remove the `+json` in the
above command.

### Example queries

The documentation of the class hierarchy, individuals and properties can be
found [here](../graph/README.md). Some sample queries are listed below.

- List all datasets
```
PREFIX dce: <https://data-collections.nfdi4ing.de/dce#>

SELECT ?service ?subject ?host WHERE {
  ?host dce:hostsService ?service .
  ?service a dce:Dataset .
  ?service dce:hasSubjectArea ?subject .
}
```

- Show whether services are Open Access or not
```
PREFIX dce: <https://data-collections.nfdi4ing.de/dce#>

SELECT ?access ?service ?host WHERE {
  ?service dce:isHostedBy ?host .
  ?service dce:isOpenAccess ?access .
}
```

- Show which services have upload size restrictions, what the limit is, and order results in descending order
```
PREFIX dce: <https://data-collections.nfdi4ing.de/dce#>

SELECT ?limit ?service ?host WHERE {
  ?service dce:isHostedBy ?host .
  ?service dce:hasDatasetSizeLimit ?limit .
}
ORDER BY DESC(?limit)
```

## License information

The following files have been adapted from the official [Apache Jena Fuseki Docker Tools](https://github.com/apache/jena/tree/main/jena-fuseki2/jena-fuseki-docker) and are licensed under the Apache 2.0 License:
- Dockerfile
- assembly-docker.xml
- docker-compose.yaml
- download.sh
- entrypoint.sh
- log4j2.properties
- pom.xml
