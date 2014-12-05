! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel words ;
IN: matasano.set1.challenge4

HELP: best-word
{ $values
    { "words" null }
    { "word" word }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge4" "Matasano set 1 challenge 4"
{ $heading "Detect single-character XOR" }
{ $url "http://cryptopals.com/sets/1/challenges/4/" }

$nl

"One of the 60-character strings in " { $snippet "resource:work/challenge4" } " has been encrypted by single-character XOR.

Find it.

(Your code from #3 should help.) "

$nl

{ $vocab-link "matasano.set1.challenge4" }
;

ABOUT: "matasano.set1.challenge4"
