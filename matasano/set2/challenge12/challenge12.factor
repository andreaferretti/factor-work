! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays assocs base64 grouping hashtables kernel locals
  matasano.common.ecb matasano.common.padding math math.ranges
  namespaces random sequences sequences.repeating ;
IN: matasano.set2.challenge12

CONSTANT: unknown-string-lines "Um9sbGluJyBpbiBteSA1LjAKV2l0aCBteSByYWctdG9wIGRvd24gc28gbXkg
aGFpciBjYW4gYmxvdwpUaGUgZ2lybGllcyBvbiBzdGFuZGJ5IHdhdmluZyBq
dXN0IHRvIHNheSBoaQpEaWQgeW91IHN0b3A/IE5vLCBJIGp1c3QgZHJvdmUg
YnkK"

: unknown-bytes ( -- str ) unknown-string-lines base64> ; inline

: append-then-encrypt ( plaintext key -- cypher ) [ unknown-bytes append 16 pad-with-zeros ] dip encrypt-ecb ;

SYMBOL: mystery-key

16 random-bytes mystery-key set

: with-key ( quot -- ) [ 16 random-bytes mystery-key ] dip with-variable ; inline

: encrypt-repeated-a ( n -- cypher ) "A" swap repeat mystery-key get append-then-encrypt ;

: all-equal? ( seq -- ? ) dup first [ = ] curry all? ;

: first-4-groups-repeat? ( seq n -- ? ) <groups> 4 head all-equal? ; inline

! This also confirms us that we are using ecb
! Not sure how to do this separately
: guess-block-size ( -- n )
  100 encrypt-repeated-a
  25 [1,b]
  [ first-4-groups-repeat? ] with find nip ;

: get-block ( bytes n -- block ) 16 * tail 16 head ;

: encrypt-1-block ( bytes n -- block' ) [ mystery-key get append-then-encrypt ] dip get-block ;

! A string composed of just enough "A" to get the next byte
: enough-a ( known-bytes -- as ) length 16 mod 15 swap - "A" swap repeat ;

: with-enough-a ( known-bytes -- as+bytes ) dup enough-a prepend ;

: block-position ( known-bytes -- n ) length 16 /i ;

: inverse-map ( seq quot: ( x -- y ) -- map ) [ [ ] bi 2array ] curry map >hashtable ; inline

: test-bytes ( -- seq ) 255 [0,b] ; inline

:: encrypt-after ( known-bytes byte -- block )
  known-bytes with-enough-a byte suffix
  known-bytes block-position encrypt-1-block ;

: detect-next-byte ( known-bytes -- byte )
  [ [ enough-a ] [ block-position ] bi encrypt-1-block ]
  [ test-bytes [ encrypt-after ] with inverse-map ]
  bi at ;

: detect-bytes ( n -- bytes ) B{ } swap [ dup detect-next-byte suffix ] times ;