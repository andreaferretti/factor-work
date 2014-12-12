! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.common.padding matasano.common.padding.private ;
IN: matasano.common.padding.tests

[ 48 ] [ 12 45 next-multiple ] unit-test
[ 49 ] [ 7 44 next-multiple ] unit-test
[ 56 ] [ 8 56 next-multiple ] unit-test
[ "ciao mamma\0\0\0\0\0\0" ] [ "ciao mamma" 16 pad-with-zeros ] unit-test