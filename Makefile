# https://learnxinyminutes.com/docs/make/
SHELL = /usr/bin/bash

VAR_FILE = variables.yaml
BIB_FILE = bib/refs.bib

# output file name
DATE = $$(date '+%Y%m%d')
FNAME = $$(niet first-name ${VAR_FILE})
LNAME = $$(niet last-name ${VAR_FILE})
MAT_NUM = $$(niet mat-number ${VAR_FILE})
COURSE_ID = $$(niet course-id ${VAR_FILE})
OUTPUT_FILE = ${DATE}_${LNAME}_${FNAME}_${MAT_NUM}_${COURSE_ID}.pdf

build:
	$(export_listings)
	$(run_code)
	$(compile_thesis)

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

tidy_bib:
	$(tidy_bib)

update_bib:
	$(update_bib)
	$(tidy_bib)


define export_listings
	@echo "Exporting listings"
	@code/.venv/bin/python\
		code/utils/export_listings.py\
		code output/listings.md\
		# --tree
endef

define run_code
	@echo "Running all code"
	@cd code; fish run_all.fish
endef

define generate_plantuml
	@plantuml plantuml/*.puml -tsvg -o ../output/plantuml
endef

define compile_thesis
	@echo "Compiling thesis"
	@pandoc\
		thesis.md -o output/${OUTPUT_FILE}\
		-s -V papersize:a4\
		--template=template/eisvogel.latex\
		--metadata-file=variables.yaml\
		--pdf-engine=xelatex\
		--filter pandoc-include\
		--filter pantable\
		--filter pandoc-crossref\
		--filter pandoc-mustache\
		--filter pandoc-latex-environment\
		--listings\
		--citeproc
endef

define tidy_bib
	@bibtex-tidy\
		${BIB_FILE}\
		--curly\
		--numeric\
		--tab\
		--align=13\
		--sort=year\
		--duplicates=key,doi,citation\
		--merge=combine\
		--no-escape\
		--sort-fields\
		--trailing-commas\
		--wrap=80
endef

define update_bib
	@bibcure -i ${BIB_FILE} -o ${BIB_FILE}
endef
