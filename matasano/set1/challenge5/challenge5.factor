! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays kernel matasano.common.xor ;
IN: matasano.set1.challenge5

: text-repeated-xor ( text key -- hex ) [ >array ] dip repeated-xor ;