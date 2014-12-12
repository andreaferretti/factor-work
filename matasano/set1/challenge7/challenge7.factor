! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: matasano.common.ecb io.encodings.ascii io.encodings.string ;
IN: matasano.set1.challenge7

: decrypt-ecb-text ( cypher key -- plaintext ) decrypt-ecb ascii decode ;