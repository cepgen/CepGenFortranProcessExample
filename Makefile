FSRC=$(wildcard *.f)
FOBJ=$(FSRC:.f=.f.o)

ifndef LIB
override LIB=libCepGenUserProcess.so
endif
CEPGEN_PATH := $(or $(CEPGEN_PATH), /usr)
CEPGEN_LIBS_DIR := $(or $(CEPGEN_LIBS_DIR), $(CEPGEN_PATH)/lib64)
CEPGEN_INCLUDE_DIR := $(or $(CEPGEN_INCLUDE_DIR), $(CEPGEN_PATH)/include)

FF := $(or $(FF), gfortran)
FFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGenCore
CFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGenCore -std=c++14 -Wall -pedantic

.PHONY: lib clean

lib: $(LIB)

%.f.o: %.f
	$(FF) $(FFLAGS) $< -c -o $@

$(LIB): $(FOBJ) ProcessesWrapper.cpp
	$(CC) $(CFLAGS) $^ -fPIC -shared -o $@

clean:
	$(RM) -f *.o $(LIB)
