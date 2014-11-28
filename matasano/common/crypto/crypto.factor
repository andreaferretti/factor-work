! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: continuations kernel namespaces openssl.libcrypto matasano.libcrypto ;
IN: matasano.common.crypto

: init-ssl-crypto ( -- )
  ERR_load_crypto_strings
  OPENSSL_add_all_algorithms_noconf
  f OPENSSL_config ;

: cleanup-ssl-crypto ( -- )
  EVP_cleanup
  ERR_free_strings ;

: with-ssl-crypto ( quot: ( -- ) -- )
  init-ssl-crypto
  [ call ] [ cleanup-ssl-crypto ] [ ] cleanup ; inline


SYMBOL: evp-context

: with-evp-context ( quot: ( -- ) -- )
  EVP_CIPHER_CTX_new evp-context [
    [ evp-context get EVP_CIPHER_CTX_free ]
    [ ] cleanup
  ] with-variable ; inline