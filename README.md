# Fortran process for CepGen
This repository provides a simple skeletton of an implementation of a Fortran process in CepGen.

Running `make` will build a shared library containing all requirements to define a process in CepGen's runtime environment.

This `.so` or `.dll` library can then be imported through the `-a` argument of CepGen's main executable, or using the `cepgen::loadLibrary` statement in user-defined executables.

A working version of CepGen is obviously required on the building system.
The default search paths for this installation are:
* `/usr/lib64` for library objects (only the `CepGenCore` module is required), and
* `/usr/include` for development headers.

These two search paths can be overriden by setting the `$(CEPGEN_LIBS_DIR)` and `$(CEPGEN_INCLUDE_DIR)` environment variables prior to running `make`.

For instance, if a local source-build of CepGen is used, these two can take the value:
```bash
export CEPGEN_LIBS_DIR=<path/to/cepgen/sources>/build
export CEPGEN_INCLUDE_DIR=<path/to/cepgen/sources>
```

In this example, the `dummy_process` Fortran double-precision typed function is built from the `*.f` source files (here, only [dummy_process.f](dummy_process.f), and registered using the [ProcessesWrapper.cpp](ProcessesWrapper.cpp) file.
This latter acts as a link between the CepGen runtime environment and this new process definition.
Two functions are respectively declaring the main matrix element, and registering it into the runtime database.
* `DECLARE_FORTRAN_FUNCTION( dummy_process )` takes the F77 name of the function as an argument.
* `REGISTER_FORTRAN_PROCESS( dummy, "A dummy Fortran process", dummy_process )` links this function to a new CepGen process named `dummy`, described with the second argument.
