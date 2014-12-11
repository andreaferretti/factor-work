! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set2.challenge10 io.encodings.ascii io.encodings.string ;
IN: matasano.set2.challenge10.tests

[ "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar" ]
[
  "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar"
  B{ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } "YELLOW SUBMARINE" encrypt-cbc
  B{ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } "YELLOW SUBMARINE" decrypt-cbc
  ascii decode
] unit-test