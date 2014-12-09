! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel ;
IN: matasano.set1.challenge8

HELP: detect-encoded-line
{ $values
    { "lines" null }
    { "line" null }
}
{ $description "" } ;

HELP: duplicate-blocks
{ $values
    { "line" null } { "block-size" null }
    { "n" null }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge8" "Matasano set 1 challenge 8"
{ $heading "Detect AES in ECB mode" }
{ $url "http://cryptopals.com/sets/1/challenges/8/" }

$nl

"In " { $snippet "resource:work/challenge8" } " are a bunch of hex-encoded ciphertexts.

One of them has been encrypted with ECB.

Detect it.

Remember that the problem with ECB is that it is stateless and deterministic; the same 16 byte plaintext block will always produce the same 16 byte ciphertext."

$nl

{ $vocab-link "matasano.set1.challenge8" }
;

ABOUT: "matasano.set1.challenge8"
