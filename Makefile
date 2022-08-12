JOIN = cat
MDC = md2pdf
IN_FMT = md
OUT_FMT = pdf
OUT_NAME = git-cheatsheet
VERSION = reference

SRCS = $(wildcard $(VERSION)/*.$(IN_FMT))
OUTS = $(OUT_NAME).$(IN_FMT) $(OUT_NAME).$(OUT_FMT)

build : $(SRCS)
	$(RM) $(OUTS)
	$(JOIN) $(filter-out $(OUTS), $(SRCS)) > $(OUT_NAME).$(IN_FMT)
	$(MDC) $(OUT_NAME).$(IN_FMT)


clean : $(OUTS)
	$(RM) $(OUTS)
