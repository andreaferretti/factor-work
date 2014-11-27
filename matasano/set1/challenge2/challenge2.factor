! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.parser ;
IN: matasano.set1.challenge2


: hexxor ( a b -- xor )
  [ hex> ] bi@ bitxor >hex ;