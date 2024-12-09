# variables
SRC_CV = cv_yw
SRC_REF3 = ref_3
SRC_REF4 = ref_4
SRC_REF_BERGMAN = ref_bergman
SRC_REF_CHENG = ref_cheng
SRC_REF_BOWERS = ref_bowers
SRC_REF_BEAUSOLEIL = ref_beausoleil
SEC_PUB_LIST = pub_list

COMPILE = latexmk 
CACHE_DIR = .cache
RM = rm -rf

# rules
.PHONY : all clean clean-cache

all : cv ref3 ref4 ref_bergman ref_cheng ref_bowers ref_beausoleil pub_list

cv : $(SRC_CV).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_CV).tex
	@cp $(CACHE_DIR)/$(SRC_CV).pdf .

ref3 : $(SRC_REF3).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF3).tex
	@cp $(CACHE_DIR)/$(SRC_REF3).pdf .

ref4 : $(SRC_REF4).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF4).tex
	@cp $(CACHE_DIR)/$(SRC_REF4).pdf .

ref_bergman : $(SRC_REF_BERGMAN).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF_BERGMAN).tex
	@cp $(CACHE_DIR)/$(SRC_REF_BERGMAN).pdf .

ref_cheng : $(SRC_REF_CHENG).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF_CHENG).tex
	@cp $(CACHE_DIR)/$(SRC_REF_CHENG).pdf .

ref_bowers : $(SRC_REF_BOWERS).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF_BOWERS).tex
	@cp $(CACHE_DIR)/$(SRC_REF_BOWERS).pdf .

ref_beausoleil : $(SRC_REF_BEAUSOLEIL).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SRC_REF_BEAUSOLEIL).tex
	@cp $(CACHE_DIR)/$(SRC_REF_BEAUSOLEIL).pdf .

pub_list : $(SEC_PUB_LIST).tex
	$(COMPILE) -lualatex -outdir=$(CACHE_DIR) $(SEC_PUB_LIST).tex
	@cp $(CACHE_DIR)/$(SEC_PUB_LIST).pdf .
	
clean : clean-cache
	@$(RM) $(SRC_CV).pdf $(SRC_REF3).pdf $(SRC_REF4).pdf $(SEC_PUB_LIST).pdf

clean-cache :
	@$(RM) $(CACHE_DIR)
	@$(RM) indent.log