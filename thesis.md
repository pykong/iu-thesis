---
title: "Inference and Causality - Workbook Assignment"
author: "Benjamin Felder"
subject: "Markdown"
keywords: [statistics, Bayesian]

# general document config
lang: "en"
titlepage: false
toc: true
toc-own-page: true
listings: true
footnotes-pretty: true
numbersections: true
codeBlockCaptions: true
linkReferences: true
float-placement-figure: H
caption-justification: centering

# citation config
link-citations: true
bibliography: [bib/refs.bib]
csl: bib/apa.csl

# additional LaTeX packages
header-includes:
  - \usepackage{pdfpages}
#   - \inputencoding{latin2}
---

# Basic Probabilities and Visualizations (1)

## Bernoulli distribution

> A vote with the outcomes **_for_** or **_against_** follows a Bernoulli distribution where $P(vote=for) = 0.03$. Represent the proportion of **_for_** and **_against_** in this single Bernoulli trial using graphics and using percentages. Can an expectation be calculated? Justify your answer.

Following Hogg, we can understand the phenomenon at hand as a Bernoulli experiment; "[...] the outcome of which can
be classified in but one of two mutually exclusive and exhaustive ways [...]" [@hoggIntroductionMathematicalStatistics p.155].

Let $X$ be a random variable associated with a single vote by defining it as follows [@hoggIntroductionMathematicalStatistics, p.155]:

$$X \sim Bern(p=for) = Bern(p = 0.03)$${#eq:Bernoulli}

### Calculate and visualize the proportions

This gives us the following proportions:

\begin{align*}
P(vote=for) &= 0.03\\
P(vote=against) &= 1 - p = 0.97
\end{align*}

These proportions can be best visualized with a column chart^[A “[lollipop chart](https://datavizproject.com/data-type/lollipop-chart/)” might be even more suitable to visualize a discrete distribution. However, Matplotlib does not offer an appropriate plot type for building those.] as generated via [@lst:1_1_Bernoulli_py]:

![Bernoulli distribution](output/img/1_1_Bernoulli.pdf){#fig:bernoulli width=75%}

\newpage

# Notes {-}

## Constant of integration

Throughout this work, the constants of integration have been omitted for simplification. In a more rigorous mathematical sense, they should be included such that:

$$\int f(x) \; dx = F(x) + c$${#eq:int_const}

\newpage

<div id="refs">
# References {-}
</div>

\newpage

# Listings {-}
