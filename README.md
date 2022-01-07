# Data Use Typology Paper

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-1928366](https://img.shields.io/badge/NSF-1928366-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1928366) [![NSF-1740699](https://img.shields.io/badge/NSF-1740699-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1740699) [![NSF-1928317](https://img.shields.io/badge/NSF-1928317-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1928317)

This repository represents work to produce figures for the paper "Revealing Earth Science code and data-use practices using the Throughput Graph Database" (in revision), intended for a GSA publication.  The repository contains data obtained from Throughput, and from manual analysis of code repositories indexed within Throughput.  All data transformations for each figure are included in separate functions within the [`figures`](figures/) folder.  The file [`gsa_paper_figures.R`](gsa_paper_figures.R) loads data and produces figures as scalable vector graphic (SVG) files within the [`svgplots`](svgplots/) folder.

## Contributors

This project is an open project, and contributions are welcome from any individual.  All contributors to this project are bound by a [code of conduct](CODE_OF_CONDUCT.md).  Please review and follow this code of conduct as part of your contribution.

* [Michael Lehnert](http://example.com/contributor_url1) [![orcid](https://img.shields.io/badge/orcid-XXXX--XXXX--XXXX--XXXX-brightgreen.svg)](https://orcid.org/XXXX-XXXX-XXXX-XXXX)
* [Morgan Wofford](http://example.com/contributor_url2) [![orcid](https://img.shields.io/badge/orcid-XXXX--XXXX--XXXX--XXXX-brightgreen.svg)](https://orcid.org/XXXX-XXXX-XXXX-XXXX)
* [Socorro Dominguez](http://example.com/contributor_url2) [![orcid](https://img.shields.io/badge/orcid-XXXX--XXXX--XXXX--XXXX-brightgreen.svg)](https://orcid.org/XXXX-XXXX-XXXX-XXXX)
* [Simon Goring](http://goring.org) [![orcid](https://img.shields.io/badge/orcid-XXXX--XXXX--XXXX--XXXX-brightgreen.svg)](https://orcid.org/XXXX-XXXX-XXXX-XXXX)
* [Andrea Thomer](http://example.com/contributor_url2) [![orcid](https://img.shields.io/badge/orcid-XXXX--XXXX--XXXX--XXXX-brightgreen.svg)](https://orcid.org/XXXX-XXXX-XXXX-XXXX)

### Tips for Contributing

Issues and bug reports are always welcome.  Code clean-up, and feature additions can be done either through pull requests to project forks or branches.

All products of the Throughput Annotation Project are licensed under an [MIT License](LICENSE) unless otherwise noted.

## How to use this repository

To generate figures, simply clone the repository locally and run the script in [`gsa_paper_figures.R`](gsa_paper_figures.R). The file uses the `pacman` package to manage package loading and installation.  As such you may need to install `pacman` prior to running the script.  You can do this either by installing the package from the R console:

```R
install.packages("pacman")
```

Once you've done this you can either open the `gsa_paper_figures.R` file and run the code, or you can call `source("gsa_paper_figures.R")` from the console.

Once the script has finished running you will see three figures in the `svgplots` folder that can be viewed or edited using image editing tools such as [Inkscape](https://inkscape.org/).

### Workflow Overview

Th project uses X core information, manages it and passes our some stuff.

### System Requirements

This project was developed using R with elements by MW, ML, SD and SG.  SG compiled all code elements into a single repository structure and applied a common coding style to the files.  It was executed using [R v4.1.2](https://cloud.r-project.org/) on Ubuntu 20.04.3 LTS.

### Data Requirements

Data required for this project was obtained from the [Throughput Annotation Database](https://throughputdb.org) using the Throughput API.

### Key Outputs

This project generates (an API, some log files, what?)

## Metrics

This project is to be evaluated using the following metrics. . .
