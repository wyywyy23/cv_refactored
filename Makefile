# variables
MAIN_DOC = cv_yw
COMPILE = latexmk
CACHE_DIR = .cache
RM = rm -rf
PRIVATE_PHONY =
PRIVATE_CLEAN_FILES =

-include Makefile.local

# rules
.PHONY : all clean clean-cache cv $(MAIN_DOC) $(PRIVATE_PHONY)

all : cv

cv : $(MAIN_DOC)

$(MAIN_DOC) : % : %.tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $<
	@cp $(CACHE_DIR)/$@.pdf .

clean : clean-cache
	@$(RM) $(MAIN_DOC).pdf
	@$(RM) $(PRIVATE_CLEAN_FILES)

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log
