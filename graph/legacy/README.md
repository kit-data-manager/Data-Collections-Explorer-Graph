# Importing data into the graph

The original dataset in `Repositories.csv` is imported into the graph using the Cellfie plugin in Protégé.

## Data preparation

Before importing the data into the graph, the following was carried out:
- Remove every occurence of `undef.` from the Open Access column. This was originally introduced as a work around to suppress superfluous emptpy from being displayed when filtering for one of the entries in the Open Access drop down menu.
- Split entries of services with more than one hosting institution into separate lines.
- Split entries of services with more than one Type entry into separate lines