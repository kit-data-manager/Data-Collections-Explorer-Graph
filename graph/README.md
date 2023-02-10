# Graph-based data model

This document explains the graph-based data model for the Data Collections Explorer. 

## Class Hierarchy

The structure is as follows:

- Host
    - A hosting institution can provide multiple, possibly different, services
- Service
    - Each instance represents a service available to the public (i.e. Zenodo)
- SubjectArea
    - Instances: should be provided by a controlled vocabulary in the future
- ServiceType
    - Two subclasses: Collection and Discrete. "Collection" encompasses everything that comprises more than one dataset, "Discrete" contains only the subclass "Dataset". Both classes "Collection" and "Discrete" are disjoint; all of "Collection's" subclasses are mutually disjoint.
    - Collection:
        - Archive
        - Bibliography
        - Catalogue
        - Database
        - Digital_Library
        - Encyclopedia
        - Ontology
        - Repository
        - Terminology_Service
    - Discrete
        - Dataset

The classes "Host", "Service", "SubjectArea" and "ServiceType" are mutually disjoint.

## Individuals

There are individuals of different types in the graph:

- SubjectArea: In the future, these could be imported from a controlled vocabulary.
- Host
- Service: These individuals have more than one type, the other coming from the class ServiceType.

All individuals of each type are mutually different to other individuals of the same type.

## Properties

### Data Properties

All data properties are mutually disjoint.

- hasAPI
    - Domain: Service class
    - Range: `xsd:string`
    - This might change in the future to not only indicate whether a service provides API access, but also the type(s) and URLs.

- hasDatasetSizeLimit
    - Domain: Service class
    - Range: `xsd:decimal[>=0]`

- hasHostURL
    - Domain: Host class
    - Range: `xsd:anyURI`
    - Characteristic: Functional

- hasServiceURL
    - Domain: Service class
    - Range: `xsd:anyURI`
    - Characteristic: Functional

- isOpenAccess
    - Domain: Service class
    - Range: `xsd:string`

### Object Properties

These are the currently available object properties:

- hasSubjectArea
    - Domain: Service class
    - Range: SubjectArea class
- hostsService
    - Domain: Host class
    - Range: Service class
    - Asymmetric
    - Inverse of isHostedBy
- isHostedBy
    - Domain: Service class
    - Range: Host class
    - Asymmetric
    - Inverse of hostsService

All object properties are mutually disjoint.

## Comments

The current version of the Data Collections Explorer has a comment field. This is replicated as an annotation: the `owl:annotationSource` is the host, whith the `owl:annotationTarget` being the service this comment is valid for.

## How to access it

Assuming you have a local instance of Apache Fuseki running, load `DCE.owl`. The ontology IRI is `http://www.semanticweb.org/p.ost/ontologies/dceng`.

## To Do

Some points that are still open:

- separate namespaces for hosts, services, properties, etc.
