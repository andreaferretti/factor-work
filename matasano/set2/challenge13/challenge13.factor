! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: assocs kernel math.parser prettyprint.backend random
  urls.encoding ;
IN: matasano.set2.challenge13

TUPLE: profile email uid role ;
C: <profile> profile

: read-qs ( qs -- profile ) query>assoc
  [ "email" of ] [ "uid" of ] [ "role" of ] tri
  [ url-decode ] tri@ <profile> ;

: profile-for ( email -- qs )
  url-encode random-32 number>string "user" <profile>
  tuple>assoc assoc>query ;