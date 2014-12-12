! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.common.ecb io.encodings.ascii io.encodings.string ;
IN: matasano.common.ecb.tests

[ "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar" ]
[
  "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura che la diritta via era smar"
  "YELLOW SUBMARINE" encrypt-ecb
  "YELLOW SUBMARINE" decrypt-ecb
  ascii decode
] unit-test