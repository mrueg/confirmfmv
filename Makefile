all: confirmfmv.xpi

confirmfmv.xpi:
	make -f Makefile.chrome -C chrome confirmfmv.jar
	rm -f $@
	zip $@ chrome/confirmfmv.jar install.rdf license.txt chrome.manifest defaults/preferences/confirmfmv-prefs.js 

babelzilla:
	make -f Makefile.chrome -C chrome babelzilla
	rm -rf confirmfmv.xpi
	zip confirmfmv.xpi chrome/confirmfmv.jar install.rdf license.txt chrome.manifest defaults/preferences/confirmfmv-prefs.js 

localize:
	rm -rf chrome/locale/*
	wget http://www.babelzilla.org/wts/download/locale/all/replaced/5240 -O chrome/locale/locales.tar.gz
	cd chrome/locale/; tar xzf locales.tar.gz
	rm -rf chrome/locale/locales.tar.gz

clean:
	rm -f chrome/confirmfmv.jar confirmfmv.xpi
