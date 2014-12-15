! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set2.challenge13 ;
IN: matasano.set2.challenge13.tests

[ T{ profile f "foo@bar.com" "10" "user" } ]
[ "email=foo@bar.com&uid=10&role=user" read-qs ] unit-test