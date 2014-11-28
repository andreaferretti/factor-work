! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: grouping kernel matasano.common math math.combinatorics math.ranges sequences ;
IN: matasano.set1.challenge6

: estimate-edit-distance ( cypher keysize -- x )
  <groups> 4 head 2 <combinations>
  [ first2 edit-distance ] map avg ;

: estimate-score ( cypher keysize -- x ) [ estimate-edit-distance ] [ nip ] 2bi / ;

: guess-keysize ( cypher -- n ) 2 40 [a,b] [ estimate-score ] with infimum-by ;

: blocks ( cypher -- blocks ) dup guess-keysize <groups> 1 head* ; ! remove the last group as it may be shorter

: guess-key ( cypher -- key ) blocks flip [ find-char-key ] "" map-as ;