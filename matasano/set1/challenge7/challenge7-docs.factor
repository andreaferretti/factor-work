! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel strings ;
IN: matasano.set1.challenge7

HELP: decrypt-ecb
{ $values
    { "cypher" null } { "key" null }
    { "plaintext" string }
}
{ $description "" } ;

ARTICLE: "matasano.set1.challenge7" "Matasano set 1 challenge 7"
{ $heading "AES in ECB mode" }
{ $url "http://cryptopals.com/sets/1/challenges/7/" }

$nl

"The Base64-encoded content in " { $snippet "resource:work/challenge7" } "  has been encrypted via AES-128 in ECB mode under the key"

{ $code "\"YELLOW SUBMARINE\"." }

"(case-sensitive, without the quotes; exactly 16 characters; I like \"YELLOW SUBMARINE\" because it's exactly 16 bytes long, and now you do too).

Decrypt it. You know the key, after all.

Easiest way: use OpenSSL::Cipher and give it AES-128-ECB as the cipher."

$nl

{ $notes "You can obviously decrypt this using the OpenSSL command-line tool, but we're having you get ECB working in code for a reason. You'll need it " { $emphasis "a lot" } " later on, and not just for attacking ECB." }

$nl

{ $vocab-link "matasano.set1.challenge7" }
;

ABOUT: "matasano.set1.challenge7"
