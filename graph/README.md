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
    - Two subclasses: Collection and Discrete. "Collection" encompasses everything that comprises more than one dataset, "Discrete" contains only the subclass "Dataset". Both classes "Collection" and "Discrete" are disjoint.
    - Collection:
        - Archive
        - Bibliography
        - Catalogue
        - Chemistry
        - Database
        - Digital_Library
        - Encyclopedia
        - Ontology
        - Repository
            - Community Repository
            - Institutional Repository
        - Terminology_Service
    - Discrete
        - Dataset

The classes "Service" and "ServiceType" are disjoint with the classes "Host" and "SubjectArea". All other classes are mutually disjoint.

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

- hasPublicationCost
    - Domain: Service class
    - Range: `xsd:string` (for now; there are multiple non-numeric entries)
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
    - Asymmetric
    - Irreflexive
- hostsService
    - Domain: Host class
    - Range: Service class
    - Asymmetric
    - Irreflexive
    - Inverse of isHostedBy
- isHostedBy
    - Domain: Service class
    - Range: Host class
    - Asymmetric
    - Irreflexive
    - Inverse of hostsService

All object properties are mutually disjoint.

## Comments

The current version of the Data Collections Explorer has a comment field. This is replicated as an annotation: the `owl:annotatedSource` is the host, with the `owl:annotatedTarget` being the service this comment is valid for; The `owl:annotatedProperty` is `hostsService` and the comment itself is an `rdfs:comment`.

## How to access it

Assuming you have a local instance of Apache Fuseki running, load `DCE.owl`. The ontology IRI is `http://www.semanticweb.org/p.ost/ontologies/dceng`.

## To Do

Some points that are still open:

- separate namespaces for hosts, services, properties, etc.
