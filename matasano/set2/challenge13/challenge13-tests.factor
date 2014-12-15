! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test matasano.set2.challenge13 accessors ;
IN: matasano.set2.challenge13.tests

[ T{ profile
  { email "foo@bar.com" }
  { uid "10" }
  { role "user"}
 } ]
[ "email=foo@bar.com&uid=10&role=user" read-qs ] unit-test

[ "foo@bar.com&role=admin" ]
[ "foo@bar.com&role=admin" profile-for read-qs email>> ] unit-test

[ "user" ]
[ "foo@bar.com&role=admin" profile-for read-qs role>> ] unit-test