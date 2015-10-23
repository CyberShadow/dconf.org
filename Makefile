#SITE=erdani.com:www/d/
SITE = dconf.org@digitalmars.com:data/

OUT = out

all: $(OUT)/index.php 2013/all 2014/all 2015/all 2016/all

.PHONY: rsync
rsync : all
	rsync -avz -p $(OUT)/* $(SITE)

.PHONY: clean
clean: 2013/clean 2014/clean
	rm -rf out

# Patterns

2013/%:
	$(MAKE) --directory=2013 OUT=../$(OUT)/2013 $*

2014/%:
	$(MAKE) --directory=2014 OUT=../$(OUT)/2014 $*

2015/%:
	$(MAKE) --directory=2015 OUT=../$(OUT)/2015 $*

2016/%:
	$(MAKE) --directory=2016 OUT=../$(OUT)/2016 $*

$(OUT)/%: %
	mkdir -p $(OUT)
	cp $< $@
