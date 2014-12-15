! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set2.challenge12 io.encodings.ascii io.encodings.string ;
IN: matasano.set2.challenge12.tests

[ "Rollin' in my 5.0
With my rag-top down so my hair can blow
The girlies on standby waving just to say hi
Did you stop? No, I just drove by
" ]
[ 138 detect-bytes ascii decode ] unit-test