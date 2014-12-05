! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel ;
IN: matasano.set1.challenge3

HELP: find-key-and-decrypt
{ $values
    { "input" null }
    { "solution" null }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge3" "Matasano set 1 challenge 3"
{ $heading "Single-byte XOR cipher" }
{ $url "http://cryptopals.com/sets/1/challenges/3/" }

$nl

"The hex encoded string: "
{ $code "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736" }
"... has been XOR'd against a single character. Find the key, decrypt the message.

You can do this by hand. But don't: write code to do it for you.

How? Devise some method for 'scoring' a piece of English plaintext. Character frequency is a good metric. Evaluate each output and choose the one with the best score. "

$nl

{ $notes "You now have our permission to make 'ETAOIN SHRDLU' jokes on Twitter." }

$nl

{ $vocab-link "matasano.set1.challenge3" }
;

ABOUT: "matasano.set1.challenge3"
