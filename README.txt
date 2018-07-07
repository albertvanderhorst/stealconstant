stealconstant

In assembler programming one needs constants that are often
only available to c-programmers. They keep them in a vault,
as it where.

``stealconstant'' is doing an inside job, disguised as a c-program
it steals all those costly constants and outputs them in a
form palatable to assembler.

You've got to define an appropriate _C macro for your assembler.
The one supplied will work most of the time.

There is of course no end to the constants you want to steal.
Feel free to add some more, you may have to include even more files!

``strerror'' does a similar job for the error messages.
AvdH
