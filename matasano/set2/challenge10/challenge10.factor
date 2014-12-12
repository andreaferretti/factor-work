! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: matasano.common.cbc io.encodings.ascii io.encodings.string ;
IN: matasano.set2.challenge10

: decrypt-cbc-text ( cypher iv key -- plaintext ) decrypt-cbc ascii decode ;