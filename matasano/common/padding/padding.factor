! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.ascii io.encodings.string kernel math
  math.functions sequences sequences.repeating ;
IN: matasano.common.padding

<PRIVATE

: next-multiple ( a b -- c ) over / ceiling * ;

PRIVATE>

: pad-right ( seq n x -- seq' ) [ over length next-multiple ] dip [ append ] padding ;

: pad-left ( seq n x -- seq' ) [ over length next-multiple ] dip [ prepend ] padding ;

: pad-with-zeros ( seq n -- seq' ) 0 pad-right ;

<PRIVATE

: repeat-self ( n -- str ) [ 1array ] [ ] bi repeat ascii decode ;

PRIVATE>

: PKCS#7-padding ( str n -- str' ) over length - repeat-self append ;