! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set2.challenge11 io.streams.string sequences ;
IN: matasano.set2.challenge11.tests


! detect-block mode with return either "ecb" or "cbc"
! at the same time a comment on which mode is used
! is printed during encoding.
! We use a string stream writer to capture that
! and then check if it contains the mode name.

[ t ] [
  [ detect-block-mode ] with-string-writer subseq?
] unit-test