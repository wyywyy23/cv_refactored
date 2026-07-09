# variables
DOCS = cv_yw ref_3 ref_4 ref_bergman ref_cheng ref_bowers ref_beausoleil pub_list

COMPILE = latexmk
CACHE_DIR = .cache
RM = rm -rf

# rules
.PHONY : all clean clean-cache cv ref3 ref4 $(DOCS)

all : $(DOCS)

cv : cv_yw

ref3 : ref_3

ref4 : ref_4

$(DOCS) : % : %.tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $<
	@cp $(CACHE_DIR)/$@.pdf .

clean : clean-cache
	@$(RM) $(addsuffix .pdf,$(DOCS))

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log
