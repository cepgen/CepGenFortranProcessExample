# Fortran process for CepGen
This repository provides a simple skeletton of an implementation of a Fortran process in CepGen.

As for other CepGen-derived projects, the build system is [CMake](https://cmake.org/), and its "standard recipe".

If you are not using a precompiled version of CepGen (i.e. your version of CepGen is [built from sources](https://cepgen.hepforge.org/install)), the `CEPGEN_PATH` environment variable should be set to the base source directory:

```bash
export CEPGEN_PATH=/path/to/cepgen/sources
```

Then, the usual CMake build recipe can be used:

```bash
mkdir build
cd build
cmake ..
make [-j]
```

The resulting object is a shared library containing all requirements to define a process in CepGen's runtime environment.
By default, the library name is set to `CepGenFortranProcess`.
However you can override it using the `PROCESS_NAME` CMake variable, i.e. adding the flag `-DPROCESS_NAME=MyProcessName` in the `cmake` command.

This `.so` or `.dll` library can then be imported through the `-a` argument of CepGen's main executable, or using the `cepgen::loadLibrary` statement in custom user-defined executables.

In this example, the `dummy_process` Fortran double-precision typed function is built from the `*.f` source files (here, only [dummy_process.f](src/dummy_process.f), and registered using the [ProcessesWrapper.cpp](ProcessesWrapper.cpp) file.
This latter acts as a link between the CepGen runtime environment and this new process definition.

In this file, two functions are respectively declaring the main matrix element, and registering it into the runtime database:
* `DECLARE_FORTRAN_FUNCTION(dummy_process)` takes the F77 name of the function as an argument ;
* `REGISTER_FORTRAN_PROCESS(dummy, "A dummy Fortran process", dummy_process)` links this function to a new CepGen process named `dummy`, described with the second argument.

Once compiled and linked into a shared library, it can be loaded into the CepGen runtime environment and added into the processes collection.
For the latter, the main CepGen executable can be steered when providing an extra `-a` flag linking to this library, i.e.
```bash
$CEPGEN_PATH/bin/cepgen -a libCepGenFortranProcess.so -i cards/dummy_cfg.py
```

All steering cards (conventionally, for backward compatibility, new ones should be following [the Python format](https://cepgen.hepforge.org/cards-python)) stored in the [cards/](cards) directory are copied into a new directory in the build directory, for simplicity.
