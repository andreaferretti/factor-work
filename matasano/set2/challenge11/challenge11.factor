! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: grouping io kernel
  matasano.common.cbc matasano.common.ecb matasano.common.padding
  math math.functions random sequences sequences.repeating ;
IN: matasano.set2.challenge11

: random-key ( -- key ) 16 random-bytes ;

: random-length ( -- n ) 1 6 random-integers first 5 + ;

: random-garbage ( -- bytes ) random-length random-bytes ;

: corrupt ( seq -- seq' ) random-garbage prepend random-garbage append ;

: random-iv ( -- iv ) 16 random-bytes ;

: random-choose ( a b -- a-or-b ) 1 random-bits 0 = [ drop ] [ nip ] if ;

: random-encrypt ( plaintext -- cypher )
  corrupt 16 pad-with-zeros
  [ random-key encrypt-ecb "using ecb" print ]
  [ random-iv random-key encrypt-cbc "using cbc" print ]
  random-choose call( x -- x ) ;

: detect-block-mode ( -- mode )
  "a" 100 repeat random-encrypt
  16 <groups> [ third ] [ fourth ] bi sequence=
  [ "ecb" ] [ "cbc" ] if ;