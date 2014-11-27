! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: matasano.common ;
IN: matasano.set1.challenge1

! : solve ( -- result )
!  HEX{ 49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d }
!  >base64 >string ;

: hex>base64 ( str -- result ) hex>bytes bytes>base64 ;