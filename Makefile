SHELL = /usr/bin/bash


build:
	$(cover_page)
	$(export_listings)
	$(run_code)
	$(compile_thesis)

cover_page:
	$(cover_page)

export_listings:
	$(export_listings)

run_code:
	$(run_code)

compile_thesis:
	$(compile_thesis)


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

define attach_cover
	@pdfunite output/cover.pdf output/thesis.pdf output/merged.pdf
endef

define resize_pdf
	# normalize all pages of pdf to DINA4
	# offset needed to prevent white line above triangle on cover page
	@pdfjam --outfile output/merged.pdf --paper a4paper --offset '0.0cm 0.6mm' output/merged.pdf
endef

define rename_pdf
	@mv output/merged.pdf output/$$(date '+%Y%m%d')_Felder_Benjamin_3200856_DLMAIIAC01.pdf
endef

define compile_thesis
	@echo "Compiling thesis"
	@pandoc\
		thesis.md output/listings.md -o output/thesis.pdf\
		--from markdown\
		--template=template/eisvogel.latex\
		--listings\
		# --filter pandoc-plantuml\
		--filter pandoc-crossref\
		--citeproc\
		--pdf-engine-opt=-shell-escape
	$(attach_cover)
	$(resize_pdf)
	$(rename_pdf)
endef
