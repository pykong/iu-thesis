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

::: note

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero quis
lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl.

:::

```markdown
::: tip Lorem ipsum dolor ... :::
```

::: tip

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero quis
lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl.

:::

```markdown
::: warning Lorem ipsum dolor ... :::
```

::: warning

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero quis
lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl.

:::

```markdown
::: caution Lorem ipsum dolor ... :::
```

::: caution

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero quis
lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl.

:::

```markdown
::: important Lorem ipsum dolor ... :::
```

::: important

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet libero quis
lectus elementum fermentum.

Fusce aliquet augue sapien, non efficitur mi ornare sed. Morbi at dictum felis.
Pellentesque tortor lacus, semper et neque vitae, egestas commodo nisl.

:::

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

::: important

**Lorem ipsum dolor** sit amet, `consectetur adipiscing` elit.

```js
if (args.length < 2) {
  System.out.println("Lorem ipsum dolor sit amet");
}
```

_Nam aliquet libero quis lectus elementum fermentum._

:::

[`pandoc-latex-environments`]:
  https://github.com/chdemko/pandoc-latex-environment/
[`awesomebox`]: https://ctan.org/pkg/awesomebox

\newpage
