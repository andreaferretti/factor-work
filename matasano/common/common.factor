! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: base64 byte-arrays.hex grouping kernel
  math math.bitwise math.parser math.ranges math.vectors
  sequences strings unicode.case unicode.categories ;
IN: matasano.common

: edit-distance ( a b -- n ) [ bitxor ] B{ } 2map-as bit-count ;

: avg ( xs -- average ) [ sum ] [ length ] bi / ;