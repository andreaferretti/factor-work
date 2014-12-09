! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: grouping hash-sets kernel matasano.common math sequences sets ;
IN: matasano.set1.challenge8

: duplicate-blocks ( line block-size -- n )
  <groups> [ length ] [ >hash-set cardinality ] bi - ;

: detect-encoded-line ( lines -- line ) [ 16 duplicate-blocks ] supremum-by ;