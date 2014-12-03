! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: base64 grouping math.parser sequences strings ;
IN: matasano.common.bytes

: hex>bytes ( str -- bytes ) 2 <groups> [ hex> ] B{ } map-as ;

: bytes>hex ( bytes -- str ) [ >hex ] { } map-as concat ;

: bytes>base64 ( bytes -- str ) >base64 >string ;