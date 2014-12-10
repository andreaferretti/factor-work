! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel strings ;
IN: matasano.set2.challenge9

HELP: padded
{ $values
    { "str" string } { "n" null }
    { "str'" string }
}
{ $description "" } ;

ARTICLE: "matasano.set2.challenge9" "Matasano set 2 challenge 9"
{ $heading "Implement PKCS#7 padding" }
{ $url "http://cryptopals.com/sets/2/challenges/9/" }

$nl

"A block cipher transforms a fixed-sized block (usually 8 or 16 bytes) of plaintext into ciphertext. But we almost never want to transform a single block; we encrypt irregularly-sized messages.

One way we account for irregularly-sized messages is by padding, creating a plaintext that is an even multiple of the blocksize. The most popular padding scheme is called PKCS#7.

So: pad any block to a specific block length, by appending the number of bytes of padding to the end of the block. For instance,"

{ $code "\"YELLOW SUBMARINE\"" }

"... padded to 20 bytes would be:"

{ $code "\"YELLOW SUBMARINE\x04\x04\x04\x04\"" }

$nl

{ $vocab-link "matasano.set2.challenge9" }
;

ABOUT: "matasano.set2.challenge9"
