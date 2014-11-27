! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set1.challenge6 io.files io.encodings.ascii sequences base64 ;
IN: matasano.set1.challenge6.tests

[ 37 ]
[ "this is a test" "wokka wokka!!!"  edit-distance ] unit-test

[ "Terminator X: Bring the noise" ]
[
  "resource:work/challenge6" ascii file-lines
  concat base64>
  solve
] unit-test