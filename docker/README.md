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

## Queries

The SPARQL endpoint can be queried using tools such as [curl](https://curl.se),
i.e., use the following command to send queries:
```
curl -H "Accept: application/sparql-results+json" -G "localhost:3030/graph" --data-urlencode 'query@query.sprq'
```
where 'query.sprq' is a file containing the actual query. Results will be returned
in JSON format; XML is possible as well, in this case remove the '+json' in the
above command.

### Example queries

The documentation of the class hierarchy, individuals and properties can be
found [here](../graph/README.md). Some sample queries are listed below.

- List all datasets
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dceng: <http://www.semanticweb.org/p.ost/ontologies/dceng#>

SELECT ?service ?subject ?host WHERE {
  ?host dceng:hostsService ?service .
  ?service a dceng:Dataset .
  ?service dceng:hasSubjectArea ?subject .
}
```

- Show whether services are Open Access or not
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dceng: <http://www.semanticweb.org/p.ost/ontologies/dceng#>

SELECT ?access ?service ?host WHERE {
  ?service dceng:isHostedBy ?host .
  ?service dceng:isOpenAccess ?access .
}
```

- Show which services have upload size restrictions and what the limit is
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dceng: <http://www.semanticweb.org/p.ost/ontologies/dceng#>

SELECT ?limit ?service ?host WHERE {
  ?service dceng:isHostedBy ?host .
  ?service dceng:hasDatasetSizeLimit ?limit .
}
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
