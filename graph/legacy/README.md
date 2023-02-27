# Importing data into the graph


## Data preparation

Before importing the data into the graph, the following was carried out in the Excel worksheet and replicated in the CSV table:
- Remove every occurence of `undef.` from the Open Access column. This was originally introduced as a work around to suppress superfluous emptpy from being displayed when filtering for one of the entries in the Open Access drop down menu.
- Split entries of services with more than one hosting institution into separate lines.
- Split entries of services with more than one Type entry into separate lines
- Move Datasets to a separate spreadsheet: All entries of type Dataset are located in Datasets.csv

## Transformation Rules

The original dataset in `Repositories.csv` is imported into the graph using the Cellfie plugin in Protégé. Cellfie transformation rules are saved as JSON files. The syntax for these rules is explained in the [MappingMaster wiki](https://github.com/protegeproject/mapping-master/wiki/MappingMasterDSL).

These are the current transformation rules:
- Import the Hosting Institution as an Individual of Type Host and sets the hostsService object property.
- Import the Service as an Individual of Type Service and set object properties hasSubjectArea and isHostedBy, as well as data properties hasAPI, hasDatasetSizeLimit, hasServiceURL and isOpenAccess.
