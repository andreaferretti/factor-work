! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: alien alien.c-types alien.syntax combinators kernel system
  alien.libraries openssl.libcrypto ;
IN: matasano.libcrypto

<<
{
    { [ os windows? ] [ "libcrypto" "libeay32.dll" cdecl add-library ] }
    { [ os macosx? ] [ "libcrypto" "libcrypto.dylib" cdecl add-library ] }
    { [ os unix? ] [ "libcrypto" "libcrypto.so" cdecl add-library ] }
} cond
>>

LIBRARY: libcrypto

! ===============================================
! err.h
! ===============================================

FUNCTION: void ERR_load_crypto_strings ( ) ;

FUNCTION: void ERR_free_strings ( ) ;

! ===============================================
! evp.h
! ===============================================

FUNCTION: void OPENSSL_add_all_algorithms_conf (  ) ;

FUNCTION: void OPENSSL_add_all_algorithms_noconf (  ) ;

FUNCTION: void OPENSSL_config ( c-string config_name ) ;

FUNCTION: void OPENSSL_no_config ( ) ;

C-TYPE: EVP_CIPHER_CTX
C-TYPE: EVP_CIPHER

FUNCTION: EVP_CIPHER_CTX* EVP_CIPHER_CTX_new ( ) ;

FUNCTION: void EVP_CIPHER_CTX_free ( EVP_CIPHER_CTX* ctx ) ;

FUNCTION: EVP_CIPHER* EVP_aes_128_ecb ( ) ;

FUNCTION: int EVP_DecryptInit_ex ( EVP_CIPHER_CTX* ctx, EVP_CIPHER *cipher, ENGINE* impl, c-string key, c-string iv ) ;

FUNCTION: int EVP_DecryptUpdate ( EVP_CIPHER_CTX* ctx, c-string out, int outl, c-string in, int inl ) ;

FUNCTION: int EVP_DecryptFinal_ex ( EVP_CIPHER_CTX* ctx, c-string outm, int outl ) ;