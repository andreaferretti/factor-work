! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set1.challenge4 io.encodings.ascii io.files ;
IN: matasano.set1.challenge4.tests

[ "Now that the party is jumping\n" ]
[ "resource:work/challenge4" ascii file-lines best-word ] unit-test