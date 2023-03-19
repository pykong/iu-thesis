# https://learnxinyminutes.com/docs/make/
SHELL = /usr/bin/bash

PDF_TITLE = "Workbook for Inference and Causality"

# output file name
DATE = $$(date '+%Y%m%d')
FNAME = Benjamin
LNAME = Felder
MAT_NUM = 3200856
COURSE_ID = DLMAIIAC01
OUTPUT_FILE = ${DATE}_${LNAME}_${FNAME}_${MAT_NUM}_${COURSE_ID}.pdf

build:
	$(cover_page)
	$(export_listings)
	$(run_code)
	$(compile_complete_document)

cover_page:
	$(cover_page)

export_listings:
	$(export_listings)

run_code:
	$(run_code)

generate_plantuml:
	$(generate_plantuml)

compile_thesis:
	$(compile_thesis)

compile_complete_document:
	$(compile_complete_document)


define cover_page
	@echo "Creating cover page"
	@pdflatex\
		-output-directory=output\
		-quiet\
		./template/cover.tex
endef

define export_listings
	@echo "Exporting listings"
	@code/.venv/bin/python code/utils/export_listings.py code output/listings.md
endef

define run_code
	@echo "Running all code"
	@cd code; fish run_all.fish
endef

define generate_plantuml
	@plantuml plantuml/*.puml -tsvg -o ../output/plantuml
endef

define attach_cover
	@pdftk output/cover.pdf output/thesis.pdf cat output output/merged.pdf
endef

define add_metadata
	@pdfjam\
		--outfile output/${OUTPUT_FILE}\
		--pdfauthor "${FNAME} ${LNAME}"\
		--pdftitle ${PDF_TITLE}\
		--pdfsubject "Assignment for ${COURSE_ID}"\
		output/${OUTPUT_FILE}
endef

define rename_pdf
	@mv output/merged.pdf output/${OUTPUT_FILE}
endef

define compile_thesis
	@echo "Compiling thesis"
	@pandoc\
		thesis.md output/listings.md -o output/thesis.pdf\
		-s -V papersize:a4\
		--from markdown\
		--template=template/eisvogel.latex\
		--filter pandoc-crossref\
		--filter pandoc-include\
		--listings\
		--citeproc\
		--pdf-engine-opt=-shell-escape
endef

define compile_complete_document
	$(compile_thesis)
	$(attach_cover)
	$(rename_pdf)
endef
