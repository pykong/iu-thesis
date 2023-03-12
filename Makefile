SHELL = /usr/bin/fish


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
	@pdfunite output/cover.pdf output/thesis.pdf output/final.pdf
	@pdfjam --outfile output/finala4.pdf --paper a4paper output/final.pdf
	@mv output/finala4.pdf output/"$(date '+%Y%m%d')"_Felder_Benjamin_3200856_DLMAIIAC01.pdf
endef
