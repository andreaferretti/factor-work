! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel matasano.common.bytes matasano.common.xor ;
IN: matasano.set1.challenge3

: find-key-and-decrypt ( input -- solution ) hex>bytes dup find-char-key decrypt ;