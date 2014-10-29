! Copyright (C) 2013 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences math math.order math.parser memoize readline io prettyprint ;
IN: levenshtein

<PRIVATE

: biapply ( a b quot quot' -- c d ) bi-curry bi ; inline
: triapply ( a b quot quot' quot'' -- c d e ) tri-curry tri ; inline
: 3min ( a b c -- min ) min min ;
: end ( seq -- seq' ) 1 tail ;
: either-empty? ( seq seq' -- seq seq' e? ) 2dup [ empty? ] bi@ or ;
: max-length ( seq seq' -- x ) [ length ] bi@ max ;
: same-first-el? ( seq seq' -- f? ) [ 1 head ] bi@ = ;
: boost ( seq seq' --  x ) same-first-el? [ 0 ] [ 1 ] if ;
: inc ( x -- x' ) 1 + ; inline

MEMO: mdist ( a b -- d )
  either-empty? [ max-length ] [
    [ end mdist inc ]
    [ swap end mdist inc ]
    [
      [ boost ]
      [ [ end ] bi@ mdist ]
      biapply +
    ]
    triapply 3min
  ] if ;

PRIVATE>

: dist ( a b -- d )
  \ mdist reset-memoized
  mdist ;
  
: interactive-dist ( -- )
  "Enter the first word: " readline
  "Enter the second word: " readline
  dist number>string print ;
  
MAIN: interactive-dist
