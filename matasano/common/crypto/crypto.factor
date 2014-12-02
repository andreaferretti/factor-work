! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: alien.data continuations io.encodings.ascii
  io.encodings.string kernel libc locals matasano.libcrypto math
  namespaces openssl.libcrypto sequences ;
IN: matasano.common.crypto

: init-ssl-crypto ( -- )
  ERR_load_crypto_strings
  OPENSSL_add_all_algorithms_noconf
  f OPENSSL_config ;

: cleanup-ssl-crypto ( -- )
  EVP_cleanup
  ERR_free_strings ;

: with-ssl-crypto ( quot -- )
  init-ssl-crypto
  [ call ] [ cleanup-ssl-crypto ] [ ] cleanup ; inline


SYMBOL: evp-context

: with-evp-context ( quot -- )
  EVP_CIPHER_CTX_new evp-context [
    [ evp-context get EVP_CIPHER_CTX_free ]
    [ ] cleanup
  ] with-variable ; inline

<PRIVATE

: byte-array>int ( bytes -- int )
  <reversed> 0 [ [ 256 * ] dip + ] reduce ;

: read-byte-number ( alien -- n )
  dup 4 memory>byte-array
  swap free byte-array>int ;

: read-byte-text ( alien len -- text )
  dupd memory>byte-array
  swap free ascii decode ;

:: init ( key method -- )
   evp-context get method f key f EVP_DecryptInit_ex
   1 = not [ "Failed cypher intialization" throw ] when ;

! :: update ( cypher -- start )
!    { { char 100000 } int } [ evp-context get -rot cypher dup length EVP_DecryptUpdate ] with-out-parameters
!    1 = not [ "Failed cypher update" throw ] when
!    head ;


:: update ( cypher max-len -- start )
  max-len malloc 4 malloc 2dup ! output parameters
  evp-context get -rot ! context
  cypher dup length ! input parameters
  EVP_DecryptUpdate
  1 = not [ "Failed cypher finalize" throw ] when
  read-byte-number read-byte-text ;

! :: finalize ( -- end )
!   { { char 10000 } int } [ evp-context get -rot EVP_DecryptFinal_ex ] with-out-parameters
!   1 = not [ "Failed cypher finalize" throw ] when
!   head ;

: finalize ( max-len -- end )
  malloc 4 malloc 2dup ! output parameters
  evp-context get -rot ! context
  EVP_DecryptFinal_ex
  1 = not [ "Failed cypher finalize" throw ] when
  read-byte-number read-byte-text ;

PRIVATE>

: decrypt ( cypher key method -- plaintext )
  [ [
      init 10000 update 100 finalize append
    ] 3curry with-evp-context
  ] 3curry with-ssl-crypto ;