Living Norway
================
Matt
11 6 2020

## LivingNorwayR Workshop 10/06/2020

### Workshop participants

-----

<div class="col2">

Erlend Nilsen - NINA

Anders Finstad - NINA/NTNU

Caitlin Mandeville - NTNU

Matteo De Stefano - NINA

Dag Endresen - NHM

Joe Chipperfield - NINA

Rukaya Johaadien - NHM

Pierre Dupont - NNBU

Bob O’Hara - NTNU

Matt Grainger - NINA

## 

-----

### Agenda

1.  Introductions
2.  Highlight the current status of the LivingNorwayR package
3.  Demonstrate a few of the functions (those with functionality).
4.  Discuss what enhancements or functionality might be useful for
    researchers.
5.  Discuss which parts of the R package workflow can be further
    automated

## Main outcomes from the meeting

### (in no particular order - Actions highlighted in bold)

1.  We should explore the option of changing from functional programming to a Object-orientated
    approach (OOP)

<!-- end list -->

  - An “object” is a data structure.
  - “Methods” can act upon the objects attributes.
  - “Classes” are used as an outline or architectural design for the
    object.
  - This will allow us to structure the data-package as a DWA from the
    start of the workflow and apply functions to different elements of
    the data object

-----

  - ***JC will look at the Darwin Core structure and create a one-to-one
    representation of it as an object class. We will then consider if
    this is the preferred way of programming for LivingNorway.***
  - ***MG will read <https://adv-r.hadley.nz/oo.html> to get a better
    understanding of the approach***
  - ***One of the main criteria for deciding if we use OOP will be the
    ease of use for the users of LivingNorwayR.***

-----

2.  We need to explore optional folder-structures for setting projects
    from different sub-disciplines

<!-- end list -->

  - For example having additional folders that may contain sound or
    video files or links to external files

-----

  - ***MG is talking with several researchers over the next few weeks to
    discuss desired functionality and how we can accommodate the needs
    of various research types. He will ask about the file structure that
    researchers need.***
  - ***AF will suggest researchers at NTNU who MG can speak with (Fishy
    people are conspicuous by their absence).***

-----

3.  The metadata Rmd needs to automate as much as possible the
    collection of metadata from the files in the data package

<!-- end list -->

  - Functions need to be embedded in to the Rmd template
  - Need to explore options to convert .Rmd to xml
  - Add OrchidID function to add metadata on authors and affiliations
    (see <https://github.com/ropensci/rorcid>)

-----

  - ***MG will embed functions for taxonomic and geographic extent into
    the Rmd template***
  - ***MG will will explore packages for conversion between Rmd and
    EML/XML (e.g. <https://ropensci.org/technotes/2018/10/01/tinkr/>)
    and structure the Rmd template accordingly.***

-----

4.  Functions/Methods should allow for re-use of data (reading in DWC
    archive) as well as using ones own data

<!-- end list -->

  - need functions for quality control of data (taxonomic names for
    example)
  - need functions to map and then validate DWCA

-----

  - ***This is possible and can be implemented in OOP. Need to add
    create an issue***
  - ***Taxonomic names checking against Artsdatabaken database is in
    development already.***
  - ***DWC mapping function is in development already (but see 7.). This
    is of high priority.***

-----

5.  The LivingNorway package could be considered a “devtools for data”
    so that it creates all the architecture in a project/package in R
    and the user then adds metadata where appropriate or needed. The
    addition of metadata will be automated at some stages with
    appropriate user validation steps.

6.  Adding additional files to the DWCA is possible already but we might
    want to consider looking at proposing extensions to the DWC that can
    be incorporated in to GBIF at a later date. Terminology for
    community descriptions is missing and perhaps should be added to the
    event-core.

7.  Mapping to DWCA will be the most difficult and time consuming part
    of the process for the user.

<!-- end list -->

  - need to make this easier by using tools (spreadsheet/RShiny etc)
  - We can make use of SQLite (see RSQLite package) to structure
    ***\[Does the OOP approach now invalidate the use of SQL here?\]***

<!-- end list -->

8.  Geographic location function needs to have output of bounding box as
    a option

9.  Taxonomic coverage of a data-set might include non-observed
    species/taxa that need to be included in the as absences in the
    data-set. We need to keep this in mind when applying
    get\_taxonomic\_coverage().

10. How do we deal with “living data” (for example annual monitoring or
    repeated seasonal sampling within the same project or monitoring
    scheme)

<!-- end list -->

  - GBIF have minor and major change system. Major changes get a new but
    linked DOI.
  - Need some clarity on when each should be applied

-----

  - ***MG to talk to RepliCATS at Uni of Melbourne to see how they deal
    with data that is regularly updated (“living data”) as they are
    developing a living atlas for psychology data-sets which has
    parallels to LivingNorway***

-----

11. We need functions to protect the locations of Red-listed species or
    species that are illegally exploited.

<!-- end list -->

  - functions need to distort geographic locations and have a key for
    legitimate researchers (held by the data creator/owner)

-----

  - ***MG to look at GBIF recommendations and build function as high
    priority***

-----

12. Need to add to the README file a list of all the functions and
    people can suggest additional functionality

-----

  - ***MG to do as high priority using ENs
    Notes\_technical\_plan\_Erlend.docx as a template***

-----

13. All are welcome to contribute to the project through GitHub or via
    email.

<!-- end list -->

  - The Master is sacred. Please branch then add pull requests
  - For non-R-coders any functionality suggestions can be sent as
    email/or post an issue on github with this format - Function name: ;
    inputs: (include type of file or user input) ; outputs:

<!-- end list -->

14. DataMapping Repo: need to develop standard vocabulary for Norwegian
    data types (e.g. Nature Index) and other datatypes like eDNA

-----

  - ***AF, CM, DE to discuss this***

-----

15. Explore collaboration with ROpenSci

-----

  - ***EN to invite ROpenSci representatives to LN seminar in October***
  - ***EN to explore options to collaborate or at least connect with
    ROpenSci***

-----

16. When more functionality has been developed we need to increase our
    beta testers

-----

  - ***MG to do a NINA seminar about LivingNorwayR and ask for a wider
    base of users to test and refine the package functions.***

-----

17. DWCViewer Repo: This package/shiny could be considered a “mini -
    portal” with functions to facilitate the viewing and plotting of
    DWCA that have been developed by the user or are available through
    Living Norway. So it is more focused on data viz and less on data
    management (LivingNorwayR is more focused on data management)

<!-- end list -->

  - Different versions of the viewer might be needed different core
    datatypes (line transect data might have a plot of the lines on a
    map and allow the user to apply distance sampling)
  - Additional functionality needed to gather data from other sources of
    information (mapping, Stats Norway etc. climate)
