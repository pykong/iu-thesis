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

<!-- markdownlint-disable-file MD041 -->

<!-- sections-start -->

!include sections/equations.md

!include sections/diagrams.md

!include sections/includes.md

!include sections/variables.md

!include sections/comments.md

!include sections/boxes.md

!include sections/tables.md

<!-- sections-end -->

# Notes {-}

\newpage

<div id="refs">
# References {-}
</div>

# Listings {-}

!include output/listings.md
