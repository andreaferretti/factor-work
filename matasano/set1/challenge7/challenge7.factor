! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: fry kernel locals namespaces
  matasano.common.crypto matasano.libcrypto ;
IN: matasano.set1.challenge7

! : empty-string ( n -- str ) iota [ drop CHAR: \s ] "" map-as ;
!
! : init ( key -- )
!   '[ evp-context get EVP_aes_128_ecb f _ f EVP_DecryptInit_ex ] call
!   1 = not [ "Failed cypher intialization" throw ] when ;
!
! :: update ( cypher -- start )
!   { { c-string } { int } } [ evp-context get -rot cypher dup length EVP_DecryptUpdate ] with-out-parameters
!   1 = not [ "Failed cypher update" throw ] when
!   head ;
!
! :: finalize ( -- end )
!   { { c-string } { int } } [ evp-context get -rot EVP_DecryptFinal_ex ] with-out-parameters
!   1 = not [ "Failed cypher finalize" throw ] when
!   head ;

!  init-ssl-crypto
!  EVP_CIPHER_CTX_new evp-context set
!  { { c-string initial: "                                            " } { int } } [ evp-context get -rot challenge get dup length EVP_DecryptUpdate ] with-out-parameters

! : decrypt ( cypher key -- plaintext )
!   [ init update finalize append ] 2curry
!   [ with-evp-context ] curry
!   with-ssl-crypto ; inline