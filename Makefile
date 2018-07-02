# $Id: Makefile $
# Copyright(2018): Albert van der Horst, HCC FIG Holland by GNU Public License
#
########################################################################
# THIS MAKEFILE SPECIFIC FOR 64 BIT LINUX
# COULD BENEFIT FROM ADDING A "configure" MECHANISM
########################################################################

# This contains commands to generate sets of equates intended
# to be used from assembler files.
# You must adapt for particular assemblers, in particular
# define an appropriate assembler macro _C for comment in
# steaconstant.m4
#

#.SUFFIXES:
.SUFFIXES:.o.c

# Related suffixes :
#
#* .asm : input file for `nasm' assembler
#* .msm : input file for `MASM' and `tasm' assembler
#* .s : input file for `gas' assembler  Experimental
#* .fas : input file for `fasm' assembler
#* .gas : input file for `gas' assembler
#+ .m4 : m4 macro's possibly including other macro's

# Normal use of m4
M4=m4
# Safer but GNU has already been "kaltgestellt".
#M4=m4 -G

# Assemblers that are accommodated, producing same binary.
ASSEMBLERS= nasm  gas fasm masm
# That's all folks!

M4_TARGETS=   \
constant_32.m4     \
constant_64.m4     \
constant_OSX.m4     \
# That's all folks!

OTHER_TARGETS=   \
stealconstant_32  \
stealconstant_64  \
stealconstant_OSX  \
# That's all folks!

# C-sources with various aims. FIXME: start with .c names.
CSRC= stealconstant.c stealconstant_64.c

%.asm:%.m4 ; m4 $< > $@

all: $(M4_TARGETS)

clean:
	rm -f  $(M4_TARGETS) $(OTHER_TARGETS)
	rm -f *.asm

# Convenience under linux's and osx.
# Steal the definitions of constants from c include's for 32 bit
stealconstant_32: stealconstant_32.c ; cc $+ -o $@

# Convenience under linux's and osx.
# Steal the definitions of constants from c include's for 64 bit
stealconstant_64: stealconstant_64.c ; cc -m64 $+ -o $@

# Build these only on osx target,
stealconstant_OSX: stealconstant_32.c ;
	@echo Doesn't work on this target

constant_32.m4: stealconstant_32
	stealconstant_32 > $@

constant_64.m4: stealconstant_64
	stealconstant_64 > $@

constant_OSX.m4:
	@echo osx constants must be generated on an osx system
	@echo By hand: build stealconstant for osx, then rename it
	@echo then use its output.
