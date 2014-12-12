! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.common.cbc io.encodings.ascii io.encodings.string ;
IN: matasano.common.cbc.tests

[ "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar" ]
[
  "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar"
  B{ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } "YELLOW SUBMARINE" encrypt-cbc
  B{ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 } "YELLOW SUBMARINE" decrypt-cbc
  ascii decode
] unit-test