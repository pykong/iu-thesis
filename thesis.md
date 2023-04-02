---
# title page
titlepage: false

# variables
mustache: variables.yaml
author: "{{first-name}} {{last-name}}"

# additional LaTeX packages
header-includes:
  - \usepackage{datetime}
  - \usepackage[11pt]{moresize}
  - \usepackage{awesomebox}

# awesomebox
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]

# general document config
lang: "en"
toc: true
toc-own-page: true
listings: true
footnotes-pretty: true
numbersections: true
codeBlockCaptions: true
linkReferences: true
float-placement-figure: H
caption-justification: centering
colorlinks: true

# citation config
link-citations: true
bibliography: [bib/refs.bib]
csl: bib/apa.csl
---

!include sections/equations.md

!include sections/includes.md

# Example: Diagrams

![PlantUML Test A](output/plantuml/PlantUMLTest_A.svg){#fig:plantuml_test_a
width=30%}

Test refering to "PlantUML Test A" [@fig:plantuml_test_a]

\newpage

!include sections/variables.md

!include sections/comments.md

!include sections/boxes.md

!include sections/tables.md

# Notes {-}

\newpage

<div id="refs">
# References {-}
</div>

# Listings {-}

!include output/listings.md
