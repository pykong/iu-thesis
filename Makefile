# https://learnxinyminutes.com/docs/make/
SHELL = /usr/bin/bash

# output file name
DATE = $$(date '+%Y%m%d')
FNAME = $$(niet first-name variables.yaml)
LNAME = $$(niet last-name variables.yaml)
MAT_NUM = $$(niet mat-number variables.yaml)
COURSE_ID = $$(niet course-id variables.yaml)
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

define compile_thesis
	@echo "Compiling thesis"
	@pandoc\
		thesis.md output/listings.md -o output/${OUTPUT_FILE}\
		-s -V papersize:a4\
		--from markdown\
		--template=template/eisvogel.latex\
		--filter pandoc-crossref\
		--filter pandoc-include\
		--listings\
		--citeproc\
		--pdf-engine-opt=-shell-escape\
		--metadata-file=variables.yaml
endef
