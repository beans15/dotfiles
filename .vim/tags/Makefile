# Makefile

.PHONY: all
all: python c cpp

.PHONY: python
python: 
	ctags -R -f python-tags --languages=python --python-kinds=-i --fields=+iaS /opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages

.PHONY: c
c:
	ctags -R -f c-tags --langmap=c:.c.h --c-kinds=+lp --fields=+iaS /usr/include

.PHONY: cpp
cpp:
	ctags -R -f cpp-tags --c++-kinds=+lp --fields=+iaS --extra=+q --language-force=c++ /usr/include/c++

.PHONY: clean
clean:
	@rm -rf python-tags c-tags cpp-tags
