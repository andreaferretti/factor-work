! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences matasano.set1.challenge3 matasano.common ;
IN: matasano.set1.challenge4

: best-word ( words -- word ) [ find-key-and-decrypt ] map [ score ] supremum-by ;