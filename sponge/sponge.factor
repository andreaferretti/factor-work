! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors byte-arrays grouping kernel math sequences
sequences.repeating ;
IN: sponge

TUPLE: sponge
  { r fixnum }
  { c fixnum }
  { bytes byte-array } ;

: <sponge> ( r c -- sponge ) 2dup + B{ 0 } swap repeat sponge boa ;

GENERIC: permute ( sponge -- sponge' )

<PRIVATE

: pad ( bytes n -- bytes' ) over length - B{ 0 } swap repeat append ;

: pad-shortest ( bytes bytes' -- bytes'' bytes''' )
  2dup max-length [ pad ] curry bi@ ;

: byte-array-xor ( bytes bytes' -- bytes'' ) pad-shortest [ bitxor ] 2map ;

: (absorb) ( sponge bytes -- sponge' )
  [ byte-array-xor ] curry change-bytes permute ;

PRIVATE>

: absorb ( sponge bytes -- sponge' )
  over r>> <groups> swap [ (absorb) ] reduce ;