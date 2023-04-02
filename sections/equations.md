# Example: Equations

## Constant of integration

Throughout this work, the constants of integration have been omitted for
simplification. In a more rigorous mathematical sense, they should be included
such that:

$$\int f(x) \; dx = F(x) + c$${#eq:int_const}

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
