# variables
SRC_CV = cv_yw
SRC_REF3 = ref_3
SRC_REF4 = ref_4

COMPILE = latexmk 
CACHE_DIR = .cache
RM = rm -rf

# rules
.PHONY : all clean clean-cache

all : cv ref3 ref4

cv : $(SRC_CV).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_CV).tex
	@cp $(CACHE_DIR)/$(SRC_CV).pdf .

ref3 : $(SRC_REF3).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF3).tex
	@cp $(CACHE_DIR)/$(SRC_REF3).pdf .

ref4 : $(SRC_REF4).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF4).tex
	@cp $(CACHE_DIR)/$(SRC_REF4).pdf .
	
clean : clean-cache
	@$(RM) $(SRC_CV).pdf

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log