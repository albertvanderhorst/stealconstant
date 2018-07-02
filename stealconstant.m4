dnl $Id: steaconstant.m4 $
dnl Copyright(2018): Albert van der Horst, HCC FIG Holland by GNU Public License
divert(-1)dnl

This is part of stealconstant, get hold of c-constants
in behalf of assembler.

Change the quotes once and for all.
Note that there is no attempt to quote the paremeters.

changequote({,})dnl

Get rid of dangerous and unwanted features in gnu m4.

undefine({changequote})

We want to use shift as a normal word.
undefine({shift})dnl

No #. dnl is quite enough comment, thank you.
changecom
undefine({changecom})

This will work for most (non-gnu) assemblers
define({_C},{;})
Something like this may be needed for bizarro assemblers.
dnl define({EQU},{=})
dnl  debugfile(stealconstant.errm4)dnl
divert{}dnl
