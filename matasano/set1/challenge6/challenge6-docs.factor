! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel ;
IN: matasano.set1.challenge6

HELP: blocks
{ $values
    { "cypher" null }
    { "blocks" null }
}
{ $description "" } ;

HELP: estimate-edit-distance
{ $values
    { "cypher" null } { "keysize" null }
    { "x" null }
}
{ $description "" } ;

HELP: estimate-score
{ $values
    { "cypher" null } { "keysize" null }
    { "x" null }
}
{ $description "" } ;

HELP: guess-key
{ $values
    { "cypher" null }
    { "key" null }
}
{ $description "" } ;

HELP: guess-key-and-decrypt
{ $values
    { "cypher" null }
    { "plaintext" null }
}
{ $description "" } ;

HELP: guess-keysize
{ $values
    { "cypher" null }
    { "n" null }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge6" "Matasano set 1 challenge 6"
{ $heading "Break repeating-key XOR" }
{ $url "http://cryptopals.com/sets/1/challenges/6/" }

$nl

{ $notes "This challenge isn't conceptually hard, but it involves actual error-prone coding. The other challenges in this set are there to bring you up to speed. This one is there to " { $strong "qualify" } " you. If you can do this one, you're probably just fine up to Set 6. " }

$nl

{ $notes "We get more tech support questions for this challenge than any of the other ones. We promise, there aren't any blatant errors in this text. In particular: the 'wokka wokka!!!' edit distance really is 37." }

$nl

{ $vocab-link "matasano.set1.challenge6" }
;

ABOUT: "matasano.set1.challenge6"
