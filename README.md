# Kaleidoscope - compile your favorite programs to bitcode

This project is basically just a gigantic Makefile that downloads and builds a lot of OpenSource programs to their bitcode representation.
Therefore, it relies heavily on the [MakeAdditions](https://github.com/tum-i22/MakeAdditions) project with an additional [LLVM opt pass](https://github.com/hutoTUM/opt-delete) to delete to imitate gcc's linking behavior.


## Build the files
After all requirements for the different programs as well as make+llvm from MakeAdditions are installed on the system, just run the following command:
```
make all -k -j `nproc`
```
Or if you need a costume clang compiler
```
make all -k -j `nproc` CLANG=/path/to/your/clang
```


## List of included projects (alphabetical)

* [GNU bc](https://www.gnu.org/software/bc/)
* [GNU bison](https://www.gnu.org/software/bison/)
* [bzip2](http://bzip.org)
* [GNU core utils](https://www.gnu.org/software/coreutils/coreutils.html)
* [GNU Diffutils](https://www.gnu.org/software/diffutils/)
* [flex](https://sourceforge.net/projects/flex)
* [GoAhead](https://embedthis.com/goahead/)
* [GNU Grep](https://www.gnu.org/software/grep/)
* [jq](https://stedolan.github.io/jq/)
* [GNU less](https://www.gnu.org/software/less/)
* [libuv](http://libuv.org/)
* [lz4](http://lz4.github.io/lz4/)
* [ngircd](https://ngircd.barton.de/)
* [GNU sed](https://www.gnu.org/software/sed/)
* [GNU tar](https://www.gnu.org/software/tar/)
* [zopfli](https://github.com/google/zopfli/)
* Feel free to add your own program ;-)
