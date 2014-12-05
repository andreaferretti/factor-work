! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel ;
IN: matasano.set1.challenge2

HELP: hexxor
{ $values
    { "a" null } { "b" null }
    { "xor" null }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge2" "Matasano set 1 challenge 2"
{ $heading "Fixed XOR" }
{ $url "http://cryptopals.com/sets/1/challenges/2/" }

$nl

"Write a function that takes two equal-length buffers and produces their XOR combination.

If your function works properly, then when you feed it the string: "
{ $code "1c0111001f010100061a024b53535009181c" }
"... after hex decoding, and when XOR'd against: "
{ $code "686974207468652062756c6c277320657965" }
" ... should produce: "
{ $code "746865206b696420646f6e277420706c6179" }

$nl

{ $vocab-link "matasano.set1.challenge2" }
;

ABOUT: "matasano.set1.challenge2"
