# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# $< first dependency
# $@ name of the target
# $^ names of all dependencies without duplicates

########################################
# Helpful Macros
########################################
MAKETARGETDIR = @mkdir -p $(@D)
MAKEPLUSLLVM = make+llvm --directory=$<
CLANG ?= /usr/bin/clang

all: bc bison bzip2 coreutils diff flex goahead grep jq less libuv lz4 ngircd sed tar zopfli

clean:
	@ rm -rf bitcode
	@ rm -rf extracted


extracted/%: download/%.tar.gz
	$(MAKETARGETDIR)
	tar -xzf $< --directory=./extracted

extracted/%: download/%.tar.xz
	$(MAKETARGETDIR)
	tar -xpf $< --directory=./extracted

extracted/%: download/%.tar.bz2
	$(MAKETARGETDIR)
	tar -xjf $< --directory=./extracted


########################################
# bc
########################################
bc: bitcode/bc-1.06.x.bc

download/bc-1.06.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/bc/bc-1.06.tar.gz" -q -O $@

bitcode/bc-1.06.x.bc: extracted/bc-1.06
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</bc/bc.x.bc $@


########################################
# bison
########################################
bison: bitcode/bison-3.0.4.x.bc

download/bison-3.0.4.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz" -q -O $@

bitcode/bison-3.0.4.x.bc: extracted/bison-3.0.4
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/bison.x.bc $@


########################################
# bzip2
########################################
bzip2: bitcode/bzip2-1.0.6.x.bc

download/bzip2-1.0.6.tar.gz:
	$(MAKETARGETDIR)
	wget -c "http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz" -q -O $@

bitcode/bzip2-1.0.6.x.bc: extracted/bzip2-1.0.6
	$(MAKETARGETDIR)
	$(MAKEPLUSLLVM)
	cp $</bzip2.x.bc $@


########################################
# coreutils
########################################
coreutils: bitcode/coreutils-8.25 bitcode/coreutils-6.10

download/coreutils-6.10.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/coreutils/coreutils-6.10.tar.gz" -q -O $@

bitcode/coreutils-6.10: extracted/coreutils-6.10
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	@mkdir -p $@
	cp $</src/*.x.bc $@/

download/coreutils-8.25.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz" -q -O $@

bitcode/coreutils-8.25: extracted/coreutils-8.25
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	@mkdir -p $@
	cp $</src/*.x.bc $@/


########################################
# diff
########################################
diff: bitcode/diff-3.5.x.bc

download/diffutils-3.5.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/diffutils/diffutils-3.5.tar.xz" -q -O $@

bitcode/diff-3.5.x.bc: extracted/diffutils-3.5
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/diff.x.bc $@


########################################
# flex
########################################
flex: bitcode/flex-2.6.0.x.bc

download/flex-2.6.0.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://downloads.sourceforge.net/project/flex/flex-2.6.0.tar.xz" -q -O $@

bitcode/flex-2.6.0.x.bc: extracted/flex-2.6.0
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/flex.x.bc $@


########################################
# GoAhead
########################################
goahead: bitcode/goahead-3.6.3.x.bc

download/goahead-3.6.3.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://embedthis.com/software/goahead-3.6.3-src.tgz" -q -O $@

bitcode/goahead-3.6.3.x.bc: extracted/goahead-3.6.3
	$(MAKETARGETDIR)
	$(MAKEPLUSLLVM)
	cp $</build/linux-*-default/bin/goahead.x.bc $@


########################################
# grep
########################################
grep: bitcode/grep-2.25.x.bc

download/grep-2.25.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/grep/grep-2.25.tar.xz" -q -O $@

bitcode/grep-2.25.x.bc: extracted/grep-2.25
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/grep.x.bc $@


########################################
# jq
########################################
jq: bitcode/jq-1.5.x.bc

download/jq-jq-1.5.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://github.com/stedolan/jq/archive/jq-1.5.tar.gz" -q -O $@

bitcode/jq-1.5.x.bc: extracted/jq-jq-1.5
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</jq.x.bc $@


########################################
# less
########################################
less: bitcode/less-481.x.bc

download/less-481.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/less/less-481.tar.gz" -q -O $@

bitcode/less-481.x.bc: extracted/less-481
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</less.x.bc $@


########################################
# libuv
########################################
libuv: bitcode/libuv-1.9.1.a.bc

download/libuv-1.9.1.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://github.com/libuv/libuv/archive/v1.9.1.tar.gz" -q -O $@

bitcode/libuv-1.9.1.a.bc: extracted/libuv-1.9.1
	$(MAKETARGETDIR)
	cd $< && sh autogen.sh && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</.libs/libuv.a.bc $@


########################################
# lz4
########################################
lz4: bitcode/lz4-r131.x.bc

download/lz4-r131.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://github.com/Cyan4973/lz4/archive/r131.tar.gz" -q -O $@

bitcode/lz4-r131.x.bc: extracted/lz4-r131
	$(MAKETARGETDIR)
	$(MAKEPLUSLLVM)
	cp $</programs/lz4.x.bc $@


########################################
# ngircd
########################################
ngircd: bitcode/ngircd-23.x.bc

download/ngircd-23.tar.xz:
	$(MAKETARGETDIR)
	wget -c "http://ngircd.barton.de/pub/ngircd/ngircd-23.tar.xz" -q -O $@

bitcode/ngircd-23.x.bc: extracted/ngircd-23
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/ngircd/ngircd.x.bc $@


########################################
# sed
########################################
sed: bitcode/sed-4.2.2.x.bc

download/sed-4.2.2.tar.bz2:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2" -q -O $@

bitcode/sed-4.2.2.x.bc: extracted/sed-4.2.2
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</sed/sed.x.bc $@


########################################
# tar
########################################
tar: bitcode/tar-1.29.x.bc

download/tar-1.29.tar.xz:
	$(MAKETARGETDIR)
	wget -c "https://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz" -q -O $@

bitcode/tar-1.29.x.bc: extracted/tar-1.29
	$(MAKETARGETDIR)
	cd $< && ./configure CC=$(CLANG)
	$(MAKEPLUSLLVM)
	cp $</src/tar.x.bc $@


########################################
# zopfli
########################################
zopfli: bitcode/zopfli-1.0.1.x.bc

download/zopfli-zopfli-1.0.1.tar.gz:
	$(MAKETARGETDIR)
	wget -c "https://github.com/google/zopfli/archive/zopfli-1.0.1.tar.gz" -q -O $@

bitcode/zopfli-1.0.1.x.bc: extracted/zopfli-zopfli-1.0.1
	$(MAKETARGETDIR)
	$(MAKEPLUSLLVM) zopfli
	cp $</zopfli.x.bc $@
