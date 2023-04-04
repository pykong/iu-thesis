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

## Diagrams

Currently PlantUML diagrams are exported to SVG via a custom make target and
afterwards included as a figure. In the future
[pandoc-plot](https://github.com/LaurentRDC/pandoc-plot) might be used for that
purpose. The diagram code might be even imported via pandoc-include into the
code block.

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

### pandoc-latex-environment

<https://github.com/chdemko/pandoc-latex-environment>

```sh
pipx install pandoc-latex-environment
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
  - cross-ref does not work across file boundaries, when using multiple md
    files: <https://github.com/notZaki/PandocCiter/issues/37>
- LanguageTool for Visual Studio Code (adamvoss.vscode-languagetool)
  - English Support for LanguageTool (adamvoss.vscode-languagetool-en)
- proselint (PatrykPeszko.vscode-proselint)
  - pipx install proselint

## IU Formatting Guidelines

- **Paper format:** DIN A4
- **Page margins:**
  - Top and bottom 2 cm;
  - left 2 cm; right 2 cm
- **Page numbers:**
  - Centered at the end of the page
  - Apart from the title page, all pages must be numbered.
  - The pages before the body of the text (if applicable, e.g. title page, table
    of contents, list of tables and abbreviations) should be numbered in Roman
    capital letters (I, II, III, IV, etc.), with the page number not appearing
    on page I (title page).
  - The introduction should be the first page with Arabic numbering, beginning
    with “1”.
    - The pages of the text part are numbered with Arabic numbers (1, 2, 3,
      etc.). These page numbers are continued to the end, i.e., also through the
      appendix (if applicable).
- **Font:**
  - General text - Arial 11 pt.
  - Headings - 12 pt.
  - Justified
  - Footnotes: Arial 10 point, justified
  - Paragraphs:
    - According to conceptual structure
    - 6 pt. spacing after line breaks
- **Line spacing:** 1.5
- **Sentence:** Justified; hyphenation
- **Citation standard:** APA
- **Title page:** The title page should contain at least the following elements:
  - type of thesis (Advanced Workbook / Research Essay / etc. ...)
  - course name,
  - course of study,
  - date, author’s name,
  - matriculation number,
  - tutor’s name.
  - _Course-specific adaptations of the information are possible._
  - _Master thesis requires morefurther information to be given._
- **Sections and subsections:**
  - A maximum of three levels (1. Main heading, 1.1 Section, 1.1.1 Subheading)
  - Only individual chapters in the text of the assignment are numbered
    consecutively
  - otherwise, sections of the assignment, such as the list of figures and/or
    tables or the bibliography, are not numbered.
- **emphasis:**
  - Do not underline
  - use _italics_ sparingly to emphasize passages.
- **page footer:**
  - The ideal position of the page numbers is centred at the bottom of the page.
- **page header:**
  - According to APA standards, the header should contain the title of the
    thesis or, if it is too long, an abbreviated version (American Psychological
    Association, 2007, p.288).

## Pandoc Options

### MAN pages

The man pages of pandoc are extensive: `man pandoc`

### default latex template

It can be insightful to study how pandoc's default latex template is structured
and what variables are being used.

[default.latex](https://github.com/jgm/pandoc-templates/blob/master/default.latex)

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
