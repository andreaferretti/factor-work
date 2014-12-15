! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: assocs kernel urls.encoding ;
IN: matasano.set2.challenge13

TUPLE: profile email uid role ;
C: <profile> profile

: read-qs ( qs -- profile ) query>assoc
  [ "email" of ] [ "uid" of ] [ "role" of ] tri <profile> ;