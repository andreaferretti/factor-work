! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays io.encodings.ascii io.encodings.string kernel
  matasano.common.bytes matasano.common.xor ;
IN: matasano.set1.challenge5

: text-repeated-xor ( text key -- hex ) [ ascii encode ] dip repeated-xor bytes>hex ;