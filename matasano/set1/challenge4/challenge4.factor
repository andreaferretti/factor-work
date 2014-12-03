! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel matasano.common.frequencies matasano.set1.challenge3 sequences ;
IN: matasano.set1.challenge4

: best-word ( words -- word ) [ find-key-and-decrypt ] map [ score ] supremum-by ;