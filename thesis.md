---
# title page
titlepage: false

# additional LaTeX packages
header-includes:
  - \usepackage{datetime}
  - \usepackage[11pt]{moresize}
  # - \inputencoding{latin2}

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

# citation config
link-citations: true
bibliography: [bib/refs.bib]
csl: bib/apa.csl
---

# Basic Probabilities and Visualizations (1)

## Bernoulli distribution

> A vote with the outcomes **_for_** or **_against_** follows a Bernoulli
> distribution where $P(vote=for) = 0.03$. Represent the proportion of **_for_**
> and **_against_** in this single Bernoulli trial using graphics and using
> percentages. Can an expectation be calculated? Justify your answer.

Following Hogg, we can understand the phenomenon at hand as a Bernoulli
experiment; "[...] the outcome of which can be classified in but one of two
mutually exclusive and exhaustive ways [...]"
[@hoggIntroductionMathematicalStatistics p.155].

Let $X$ be a random variable associated with a single vote by defining it as
follows [@hoggIntroductionMathematicalStatistics, p.155]:

$$X \sim Bern(p=for) = Bern(p = 0.03)$${#eq:Bernoulli}

### Calculate and visualize the proportions

This gives us the following proportions:

<!-- Multi-line $$ $$ break prettier, always extending $$ to the end of file -->
<!-- $$
\begin{aligned}
P(vote=for) &= 0.03\\
P(vote=against) &= 1 - p = 0.97
\end{aligned}
$${#eq:multi_line} -->

These proportions can be best visualized with a column chart^[A
“[lollipop chart](https://datavizproject.com/data-type/lollipop-chart/)” might
be even more suitable to visualize a discrete distribution. However, Matplotlib
does not offer an appropriate plot type for building those.] as generated via
[@lst:1_1_Bernoulli_py]:

![Bernoulli distribution](output/img/1_1_Bernoulli.pdf){#fig:bernoulli
width=75%}

\newpage

# Code Sample 1

Include entire python file and reference, using pandoc-include.

```{#lst:code1 caption="Listing caption"}
!include ./code/example.py
```

Heyho, referencing [@lst:code1].

\newpage

# Notes {-}

## Constant of integration

Throughout this work, the constants of integration have been omitted for
simplification. In a more rigorous mathematical sense, they should be included
such that:

$$\int f(x) \; dx = F(x) + c$${#eq:int_const}

\newpage

## Multi-line equations

Labelling, aligning and referencing multi-line equations, difficult using pandoc
and pandoc-crossref (<https://github.com/lierdakil/pandoc-crossref/issues/131>).
The following example shows how it can be done nonetheless. This does not
require any hacks, workarounds or any additional logic.

<!-- prettier-ignore-start -->

\begin{align}
  1 + 0 & = 1, \label{eq1} \\
  1 + 1 & = 2. \label{eq2}
\end{align}

\begin{align*}
  1 + 2 = 3 \\
  3 + 2 = 5
\end{align*}

$$ a = b + c $$ {#eq:ggg}

\begin{align}
  f(x) &= x + a \label{eq:one} \\
  g(x) &= a x \label{eq:two} \\
  e           &= x * mc ** 2 \label{eq:emcsquared}
\end{align}

\begin{align}
  f(x) &= x^2\\
  g(x) &= \frac{1}{x} \label{eq:frac1}\\
  F(x) &= \int^a_b \frac{1}{3}x^3 \label{eq:frac2}
\end{align}

<!-- prettier-ignore-end -->

Holla [@eq:ggg] Hey, equations [@eq:one], [@eq:two] and [@eq:emcsquared]

Full math supported [@eq:frac1], [@eq:frac2].

\newpage

![PlantUML Test A](output/plantuml/PlantUMLTest_A.svg){#fig:plantuml_test_a
width=30%}

Test refering to "PlantUML Test A" [@fig:plantuml_test_a]

\newpage

## Tables

```{#tbl:dummyTable .table}
---
caption: '*Awesome* **Dummy** Table'
alignment: RC
table-width: 2/3
markdown: True
include: ./data/dummy.csv
---
```

We can reference our imported table: [@tbl:dummyTable]

\newpage

<div id="refs">
# References {-}
</div>

# Listings {-}

!include output/listings.md
