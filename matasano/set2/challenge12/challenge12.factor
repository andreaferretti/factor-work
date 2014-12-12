! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays assocs base64 grouping hashtables kernel
  matasano.common.ecb matasano.common.padding math math.ranges
  namespaces random sequences sequences.repeating ;
QUALIFIED: generalizations
IN: matasano.set2.challenge12

CONSTANT: unknown-string-lines "Um9sbGluJyBpbiBteSA1LjAKV2l0aCBteSByYWctdG9wIGRvd24gc28gbXkg
aGFpciBjYW4gYmxvdwpUaGUgZ2lybGllcyBvbiBzdGFuZGJ5IHdhdmluZyBq
dXN0IHRvIHNheSBoaQpEaWQgeW91IHN0b3A/IE5vLCBJIGp1c3QgZHJvdmUg
YnkK"

: unknown-bytes ( -- str ) unknown-string-lines base64> ; inline

: append-then-encrypt ( plaintext key -- cypher ) [ unknown-bytes append 16 pad-with-zeros ] dip encrypt-ecb ;

SYMBOL: mystery-key

16 random-bytes mystery-key set

: encrypt-repeated-a ( n -- cypher ) "A" swap repeat mystery-key get append-then-encrypt ;

: all-equal? ( seq -- ? ) dup first [ = ] curry all? ;

: first-4-groups-repeat? ( seq n -- ? ) <groups> 4 head all-equal? ; inline

! This also confirms us that we are using ecb
! Not sure how to do this separately
: guess-block-size ( -- n )
  100 encrypt-repeated-a
  25 [1,b]
  [ first-4-groups-repeat? ] with find nip ;

: encrypt-1-block ( block -- block' ) mystery-key get append-then-encrypt 16 head ;

: enough-a ( known-bytes -- as ) length 15 swap - "A" swap repeat ;

: detect-next-byte ( known-bytes -- byte )
  [ dup enough-a prepend encrypt-1-block ]
  [ enough-a 255 [0,b]
    [
      [ suffix encrypt-1-block ] [ nip ] 2bi 2array
    ] with
    map >hashtable
  ] bi at ;

: detect-1-byte ( start -- byte )
  [ encrypt-1-block ]
  [ 255 [0,b]
    [
      [ suffix encrypt-1-block ] [ nip ] 2bi 2array
    ] with
    map >hashtable
  ] bi at ;

: detect-16-bytes ( -- bytes )
  B{ } 16
  [ dup detect-next-byte suffix ] times ;