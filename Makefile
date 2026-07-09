# variables
MAIN_DOC = cv_yw
STANDALONE_DIR = standalone
STANDALONE_PDF_DIR = $(STANDALONE_DIR)/pdf
STANDALONE_DOCS = ref_3 ref_4 ref_bergman ref_cheng ref_bowers ref_beausoleil pub_list

COMPILE = latexmk
CACHE_DIR = .cache
RM = rm -rf

# rules
.PHONY : all clean clean-cache cv standalone ref3 ref4 $(MAIN_DOC) $(STANDALONE_DOCS)

all : cv standalone

cv : $(MAIN_DOC)

standalone : $(STANDALONE_DOCS)

ref3 : ref_3

ref4 : ref_4

$(MAIN_DOC) : % : %.tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $<
	@cp $(CACHE_DIR)/$@.pdf .

$(STANDALONE_DOCS) : % : $(STANDALONE_DIR)/%.tex | $(STANDALONE_PDF_DIR)
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $<
	@cp $(CACHE_DIR)/$@.pdf $(STANDALONE_PDF_DIR)/

$(STANDALONE_PDF_DIR) :
	@mkdir -p $@

clean : clean-cache
	@$(RM) $(MAIN_DOC).pdf
	@$(RM) $(addprefix $(STANDALONE_PDF_DIR)/,$(addsuffix .pdf,$(STANDALONE_DOCS)))
	@$(RM) $(addsuffix .pdf,$(STANDALONE_DOCS))

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log
