! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.ascii io.encodings.string kernel math
  sequences sequences.repeating ;
IN: matasano.set2.challenge9

<PRIVATE

: padding-string ( n -- str ) [ 1array ] [ ] bi repeat ascii decode ;

PRIVATE>

: padded ( str n -- str' ) over length - padding-string append ;