! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel matasano.common.frequencies math math.parser
  math.ranges sequences ;
IN: matasano.common.xor

: decrypt ( cypher key -- clear ) [ bitxor ] curry "" map-as ;

: find-char-key ( cypher -- key ) 255 [0,b] [ decrypt score ] with supremum-by ;

<PRIVATE

: repeated-nth ( n seq -- elt ) dup [ length mod ] dip nth ;

: >padded-hex ( n -- str ) >hex 2 CHAR: 0 [ prepend ] padding ;

PRIVATE>

: repeated-xor ( cypher key -- hex ) [ repeated-nth bitxor >padded-hex ] curry map-index concat ;