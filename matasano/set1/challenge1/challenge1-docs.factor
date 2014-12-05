! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel strings ;
IN: matasano.set1.challenge1

HELP: hex>base64
{ $values
    { "str" string }
    { "result" null }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge1" "Matasano set 1 challenge 1"
{ $heading "Convert hex to base64" }
{ $url "http://cryptopals.com/sets/1/challenges/1/" }

$nl

"The string:"
{ $code "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d" }
"Should produce:"
{ $code "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t" }
"So go ahead and make that happen. You'll need to use this code for the rest of the exercises"

$nl

{ $notes "Always operate on raw bytes, never on encoded strings. Only use hex and base64 for pretty-printing." }

$nl

{ $vocab-link "matasano.set1.challenge1" }
;

ABOUT: "matasano.set1.challenge1"
