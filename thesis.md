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

# Example: Equations

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

# Example: Includes

Include entire python file and reference, using pandoc-include.

```{#lst:code1 caption="Listing caption"}
!include ./code/example.py
```

Heyho, referencing [@lst:code1].

\newpage

# Example: Diagrams

![PlantUML Test A](output/plantuml/PlantUMLTest_A.svg){#fig:plantuml_test_a
width=30%}

Test refering to "PlantUML Test A" [@fig:plantuml_test_a]

\newpage

# Example: Variables

We can replace expand variables in our document (not just the template) using
pandoc-mustache.

Example - my matriculation number is: {{mat-number}}

We can even expand nested variables: {{complex-variable.prop1}}

\newpage

# Example: Comments

<!-- I am a comment. I should not appear in the rendered document. -->

Ipsum labore Lorem sunt commodo est ullamco excepteur exercitation occaecat sint
consectetur nisi nisi. Dolore tempor ea sit sint officia ipsum consequat enim.
Consequat veniam exercitation deserunt officia pariatur commodo aliqua
consequat.

\newpage

# Example: Boxes

This example demonstrates the use of the filter [`pandoc-latex-environments`] to
create custom boxes with the [`awesomebox`] package. _pandoc-latex-environment_
is a pandoc filter for adding LaTeX environement on specific HTML div tags.

The following examples are taken from
<https://github.com/Wandmalfarbe/pandoc-latex-template/tree/master/examples/boxes-with-pandoc-latex-environment-and-awesomebox>:

## Box Types

For a list of all available boxes and options visit the
[`awesomebox` documentation](https://ctan.org/pkg/awesomebox).

```markdown
::: note Lorem ipsum dolor ... :::
```

::: note Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet
libero quis lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl. :::

```markdown
::: tip Lorem ipsum dolor ... :::
```

::: tip Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet
libero quis lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl. :::

```markdown
::: warning Lorem ipsum dolor ... :::
```

::: warning Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet
libero quis lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl. :::

```markdown
::: caution Lorem ipsum dolor ... :::
```

::: caution Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet
libero quis lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl. :::

```markdown
::: important Lorem ipsum dolor ... :::
```

::: important Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
aliquet libero quis lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl. :::

One can also use raw HTML `div` tags to create the custom environments.

```markdown
<div class="important">
Lorem ipsum dolor ...
</div>
```

<div class="important">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero
quis lectus elementum fermentum.
</div>

Markdown formatting inside the environments is supported.

::: important **Lorem ipsum dolor** sit amet, `consectetur adipiscing` elit.

```js
if (args.length < 2) {
  System.out.println("Lorem ipsum dolor sit amet");
}
```

_Nam aliquet libero quis lectus elementum fermentum._ :::

[`pandoc-latex-environments`]:
  https://github.com/chdemko/pandoc-latex-environment/
[`awesomebox`]: https://ctan.org/pkg/awesomebox

\newpage

# Example: Tables

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

# Notes {-}

\newpage

<div id="refs">
# References {-}
</div>

# Listings {-}

!include output/listings.md
