# IU-Thesis

## Installing pdflatex

<https://gist.github.com/rain1024/98dd5e2c6c8c28f9ea9d>

```sh
sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
```

## Installing LaTeX

Consult the Eisvogel installation instructions:

<https://github.com/Wandmalfarbe/pandoc-latex-template#installation>

Note: Installing MikTeX caused compile errors.

## Citation Styles

Get them from here:

<https://github.com/citation-style-language/styles>

## Cover Page Hack

The title page section has been overwritten in the Eisvogel template with a
pandoc template partial, in order to provide a custom cover that can still
expand pandoc's variables. See issue on the Eisvogel GitHub for further details:

<https://github.com/Wandmalfarbe/pandoc-latex-template/issues/260>

## Dependencies

### niet

```sh
pipx install niet
```

### plantuml

```sh
sudo apt install plantuml
```

### pandoc-include

<https://github.com/DCsunset/pandoc-include>

```sh
pipx install pandoc-include
```

### pandoc-mustache

<https://github.com/michaelstepner/pandoc-mustache>

```sh
pipx install pandoc-mustache
```

### pantable

<https://github.com/ickc/pantable>

```sh
pipx install pantable
```

### bibtex-tidy

<https://www.npmjs.com/package/bibtex-tidy>
<https://flamingtempura.github.io/bibtex-tidy>

```sh
npm install -g bibtex-tidy
```

### bibcure

<https://github.com/bibcure/bibcure>

```sh
pipx install bibcure
```

## Visual Studio Code Plugins

- Markdown All in One (yzhang.markdown-all-in-one)
- Markdown+Math (goessner.mdmath)
- markdownlint (DavidAnson.vscode-markdownlint)
- Pandoc Citer (notZaki.pandocciter)
- LanguageTool for Visual Studio Code (adamvoss.vscode-languagetool)
  - English Support for LanguageTool (adamvoss.vscode-languagetool-en)
- proselint (PatrykPeszko.vscode-proselint)
  - pipx install proselint

## Notes

### On prettier

This project is using prettier for formatting markdown files. Unfortunately,
prettier screws up when encountering a multiline math block using double dollar
signs. This annoyingly led to prettier to insert another at the end of the file.

<https://github.com/executablebooks/mdformat#why-not-use-prettier-instead>

## Links

<https://pandoc.org/MANUAL.html#pandocs-markdown>
<https://learnxinyminutes.com/docs/make/>
<https://lierdakil.github.io/pandoc-crossref/>
