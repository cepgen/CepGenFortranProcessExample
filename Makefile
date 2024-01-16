LOCAL_CEPGEN_INSTALL=1  # specify whether the CepGen installation is on a user-local folders structure
												# or installed in a global /usr or /usr/local structure

FSRC=$(wildcard *.f)
FOBJ=$(FSRC:.f=.f.o)

LIB := $(or $(LIB), libCepGenUserProcess.so)
CEPGEN_PATH := $(or $(CEPGEN_PATH), /usr/local)
ifneq ($(strip $(LOCAL_CEPGEN_INSTALL)), 1)
CEPGEN_LIBS_DIR := $(or $(CEPGEN_LIBS_DIR), $(CEPGEN_PATH)/lib64)
CEPGEN_INCLUDE_DIR := $(or $(CEPGEN_INCLUDE_DIR), $(CEPGEN_PATH)/include)
else
CEPGEN_LIBS_DIR := $(CEPGEN_PATH)/build
CEPGEN_INCLUDE_DIR := $(CEPGEN_PATH)
endif

FF := $(or $(FF), gfortran)
FFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGen
CFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGen -std=c++14 -Wall -pedantic

.PHONY: lib clean

lib: $(LIB)

%.f.o: %.f
	$(FF) $(FFLAGS) $< -c -o $@

$(LIB): $(FOBJ) ProcessesWrapper.cpp
	$(CC) $(CFLAGS) $^ -fPIC -shared -o $@

clean:
	$(RM) -f *.o $(LIB)

test:
	@echo '***** CepGen variables *****'
	@echo ' CEPGEN_PATH: $(CEPGEN_PATH)'
	@echo ' CEPGEN_LIBS_DIR: $(CEPGEN_LIBS_DIR)'
	@echo ' CEPGEN_INCLUDE_DIR: $(CEPGEN_INCLUDE_DIR)'
	@echo '****************************'
