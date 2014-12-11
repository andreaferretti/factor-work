! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: crypto.aes grouping kernel math sequences ;
IN: matasano.set2.challenge10

<PRIVATE

: encrypt-block ( key prev block -- encrypted ) [ bitxor ] 2map aes-encrypt-block ;

: encrypt-blocks-cbc ( blocks iv key -- last-block other-blocks )
  [ -rot encrypt-block ] curry accumulate ;

: discard-iv ( blocks -- blocks' ) 1 tail ; inline

PRIVATE>

: encrypt-cbc ( plaintext iv key -- cypher )
  [ 16 <groups> ] 2dip encrypt-blocks-cbc
  discard-iv concat prepend ;

<PRIVATE

: decrypt-all ( blocks key -- blocks' ) [ swap aes-decrypt-block ] curry map ;

: xor-blocks ( blocks iv -- blocks' ) prefix 1 head* ;

PRIVATE>

: decrypt-cbc ( cypher iv key -- plaintext )
  [ 16 <groups> ] 2dip
  [ xor-blocks ] [ decrypt-all ] bi-curry* bi
  [ concat ] bi@
  [ bitxor ] 2map ;