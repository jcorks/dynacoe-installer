DYNACOE_INSTALL_PATH_CORRECTED := $(shell cat ./PATH)
DYNACOE_VER         = $(shell cat "$(DYNACOE_INSTALL_PATH_CORRECTED)/userspace/ver/DEFAULT")
DYNACOE_ROOT        = $(DYNACOE_INSTALL_PATH_CORRECTED)/userspace/ver/$(DYNACOE_VER)/
DYNACOE_LIB_PATH    = $(DYNACOE_ROOT)/build/lib/

# Basic makefile for Dynacoe

OUTPUT_NAME = $(shell cat ./PROJECT)

SRCS = $(shell cat ../SOURCES)
INCS = $(shell if [ -f ../INCLUDES ] ; then cat ../INCLUDES ; fi)
FLGS = $(shell cat "$(DYNACOE_LIB_PATH)lib_compileropts") $(shell if [ -f ../FLAGS ] ; then cat ../FLAGS ; fi)
LIBS = $(shell if [ -f ../LIBRARIES ] ; then cat ../LIBRARIES ; fi)

# Turn all 
SRCS := $(patsubst %,../%,$(SRCS))





#--------------------
#--------------------
#--------------------


CC = g++
LD = -std=c++11


# Define Dynacoe assets
#DYNACOE_INPUT_BACKEND_LIBS_GAINPUT = -lgainputstatic
DYNACOE_INC_PATHS   = /DynacoeSrc/includes/  /$(shell cat "$(DYNACOE_LIB_PATH)/lib_incpaths")
DYNACOE_LIB_PATHS   = $(shell cat "$(DYNACOE_LIB_PATH)lib_libpaths")   
DYNACOE_LIB_NAME    = -ldynacoe

DYNACOE_LIBS        =  $(shell cat "$(DYNACOE_LIB_PATH)build_libs") 


DYNACOE_INC_PATHS := $(patsubst %,-I$(DYNACOE_ROOT)%, $(DYNACOE_INC_PATHS))
DYNACOE_LIB_PATHS := $(patsubst %,-L$(DYNACOE_ROOT)%, $(DYNACOE_LIB_PATHS)) "-L$(DYNACOE_LIB_PATH)"




# Gather proper vars

TEMP := $(LIBS)
LIBS := $(DYNACOE_LIB_NAME) $(DYNACOE_LIBS) $(LIBS) 


TEMP := $(INCS)
INCS := $(DYNACOE_INC_PATHS) $(INCS)

USER_OBJS    := $(patsubst %,%.o, $(SRCS))
ALL_SRCS := $(SRCS)

# Compile objects - main target


all: $(USER_OBJS)
	$(CC) -O2 $(OS_FLAGS)  $(LD) $(FLGS) $(DYNACOE_LIB_PATHS)  $(USER_OBJS) -o ../$(OUTPUT_NAME)  $(LIBS)  

debug: $(USER_OBJS)
	$(CC) -g -pg $(OS_FLAGS)  $(LD) $(FLGS) $(DYNACOE_LIB_PATHS)  $(USER_OBJS) -o ../$(OUTPUT_NAME)  $(LIBS)

# each object file
%.o: %
	@echo "Compiling $@"
	@$(CC) $(OS_FLAGS) $(FLGS) $(LD)  $(INCS) -c $(filter %$(patsubst %.o,%,$@), $(ALL_SRCS)) -o $@


	
clean:
	rm -f $(USER_OBJS) ../$(OUTPUT_NAME)
