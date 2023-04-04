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
  - \setlength{\parskip}{6pt}
  - \pagenumbering{roman}

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
# lot: true
# lof: true
listings: true
footnotes-pretty: true
numbersections: true
codeBlockCaptions: true
linkReferences: true
float-placement-figure: H
caption-justification: centering
colorlinks: true

# formatting
fontsize: 11pt
linestretch: 1.5
mainfont: Arial
sansfont: Arial # captions
geometry: margin=2cm
header-left: "{{subject}}"
header-right: "{{title}}"
footer-left: \null
footer-center: \thepage
footer-right: \null

# citation config
link-citations: true
bibliography: [bib/refs.bib]
csl: bib/apa.csl
---

<!-- markdownlint-disable-file MD041 -->

<!-- prettier-ignore-start -->
\pagenumbering{arabic}
\setcounter{page}{1}
<!-- prettier-ignore-end -->

<!-- sections-start -->

!include sections/introduction.md

!include sections/equations.md

!include sections/diagrams.md

!include sections/includes.md

!include sections/variables.md

!include sections/comments.md

!include sections/boxes.md

!include sections/tables.md

!include sections/notes.md

<!-- sections-end -->

<div id="refs">
# References {-}
</div>

# Listings {-}

!include output/listings.md
