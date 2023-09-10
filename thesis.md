---
# title page
titlepage: true

# variables
mustache: variables.yaml
author: "{{first-name}} {{last-name}}"

# additional LaTeX packages
header-includes:
  - \setcounter{secnumdepth}{3}
  # strangely it flakely does not compile without graphicx
  - \usepackage{graphicx}
  - \usepackage{datetime}
  - \usepackage[11pt]{moresize}
  - \usepackage{awesomebox}
  - \setlength{\parskip}{6pt}
  - \renewcommand{\footnotesize}{\small}

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

# fonts
fontsize: 11pt
linestretch: 1.5
mainfont: Arial
sansfont: "Nimbus Sans" # captions
monofont: "Ubuntu Mono"
mathfont: "Berenis ADF Pro Math"

# margins
margin-top: 3cm
margin-bottom: 3cm
margin-left: 2cm
margin-right: 2cm

# header & footer
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
