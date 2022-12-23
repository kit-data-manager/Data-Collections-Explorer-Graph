# Graph-based data model

This document explains the graph-based data model for the Data Collections Explorer. 

## Class Hierarchy

The structure is as follows:

- SubjectArea
    - Instances: should be provided by a controlled vocabulary in the future
    - Disjoint with ServiceType
- ServiceType
    - Two subclasses: Collection and Discrete. 'Collection' encompasses everything that comprises more than one dataset, 'Discrete' contains only the subclass "Dataset". Both classes "Collection" and "Discrete" are disjoint; all of "Collection's" subclasses are mutually disjoint.
    - Collection:
        - Archive
        - Bibliography
        - Catalogue
        - Database
        - Digital_Library
        - Encyclopedia
        - Ontology
        - Repsository
        - Terminology_Service
    - Discrete
        - Dataset
