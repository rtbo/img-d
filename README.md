# img-d

img-d is a set of bindings to manipulate images with the D programming language.
At the moment only contains bindings to the C libraries:
 - libjpeg-turbo-1.3.0
 - libpng-1.6.16

`img-d` ships with static libraries built for various ABIs. (built by `img-d-clibsbuild`)
Dub will transparently add the C code directly into the D archive avoiding apps to link or ship C dlls.

The one exception to this is dmd for windows-x86.
Because it uses a dinosaure linker, the only way that works at the moment is the application to link to import libraries and ship needed dlls.
This is the usual process with dmd.
Those import libraries and dlls are built by `img-d-clibsbuild` and shipped with `img-d` under the `clibs-windows-x86-dmd` directory.