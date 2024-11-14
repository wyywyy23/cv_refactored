# variables
SRC_CV = cv_yw
COMPILE = latexmk 
CACHE_DIR = .cache
RM = rm -rf

# rules
.PHONY : all clean clean-cache

all : cv

cv : $(SRC_CV).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_CV).tex
	@cp $(CACHE_DIR)/$(SRC_CV).pdf .
	
clean : clean-cache
	@$(RM) $(SRC_CV).pdf

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log