! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: matasano.common.padding ;
IN: matasano.set2.challenge9

: padded ( str n -- str' ) PKCS#7-padding ;