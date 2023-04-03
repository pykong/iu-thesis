# Example: Includes

We are using `pandoc-include` for including other files. We can include both
directly into the paranet document, as well as fill-out code blocks, as shown in
the examples below.

## Whole file inclusion

Include entire python file and reference it.

```{#lst:code1 caption="Whole file inclusion"}
!include ../code/example.py
```

Heyho, referencing [@lst:code1].

## Partial file inclusion

Include partial python file.

```{#lst:code2 caption="Partial file inclusion"}
!include`snippetStart="#region include-me", snippetEnd="#endregion include-me"` ../code/example2.py
```

\newpage
