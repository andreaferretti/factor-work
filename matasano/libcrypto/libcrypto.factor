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
! evp.h -- see http://osxr.org/openssl/source/crypto/evp/evp.h
! ===============================================


CONSTANT: EVP_CTRL_INIT               0
CONSTANT: EVP_CTRL_SET_KEY_LENGTH     1
CONSTANT: EVP_CTRL_GET_RC2_KEY_BITS   2
CONSTANT: EVP_CTRL_SET_RC2_KEY_BITS   3
CONSTANT: EVP_CTRL_GET_RC5_ROUNDS     4
CONSTANT: EVP_CTRL_SET_RC5_ROUNDS     5
CONSTANT: EVP_CTRL_RAND_KEY           6
CONSTANT: EVP_CTRL_PBE_PRF_NID        7
CONSTANT: EVP_CTRL_COPY               8
CONSTANT: EVP_CTRL_GCM_SET_IVLEN      9
CONSTANT: EVP_CTRL_GCM_GET_TAG        10
CONSTANT: EVP_CTRL_GCM_SET_TAG        11
CONSTANT: EVP_CTRL_GCM_SET_IV_FIXED   12
CONSTANT: EVP_CTRL_GCM_IV_GEN         13
CONSTANT: EVP_CTRL_CCM_SET_IVLEN      EVP_CTRL_GCM_SET_IVLEN
CONSTANT: EVP_CTRL_CCM_GET_TAG        EVP_CTRL_GCM_GET_TAG
CONSTANT: EVP_CTRL_CCM_SET_TAG        EVP_CTRL_GCM_SET_TAG
CONSTANT: EVP_CTRL_CCM_SET_L          14
CONSTANT: EVP_CTRL_CCM_SET_MSGLEN     15

FUNCTION: void OPENSSL_add_all_algorithms_conf (  ) ;

FUNCTION: void OPENSSL_add_all_algorithms_noconf (  ) ;

FUNCTION: void OPENSSL_config ( c-string config_name ) ;

FUNCTION: void OPENSSL_no_config ( ) ;

C-TYPE: EVP_CIPHER_CTX
C-TYPE: EVP_CIPHER

FUNCTION: EVP_CIPHER_CTX* EVP_CIPHER_CTX_new ( ) ;

FUNCTION: void EVP_CIPHER_CTX_free ( EVP_CIPHER_CTX* ctx ) ;

FUNCTION: int EVP_EncryptInit_ex ( EVP_CIPHER_CTX* ctx, EVP_CIPHER* cipher, ENGINE* impl, c-string key, c-string iv) ;

FUNCTION: int EVP_EncryptUpdate ( EVP_CIPHER_CTX* ctx, char* out, int* outl, c-string in, int inl ) ;

FUNCTION: int EVP_EncryptFinal_ex ( EVP_CIPHER_CTX* ctx, char* out, int* outl ) ;

FUNCTION: int EVP_DecryptInit_ex ( EVP_CIPHER_CTX* ctx, EVP_CIPHER *cipher, ENGINE* impl, c-string key, c-string iv ) ;

FUNCTION: int EVP_DecryptUpdate ( EVP_CIPHER_CTX* ctx, char* out, int* outl, c-string in, int inl ) ;

FUNCTION: int EVP_DecryptFinal_ex ( EVP_CIPHER_CTX* ctx, char* outm, int* outl ) ;

FUNCTION: int EVP_CIPHER_CTX_ctrl ( EVP_CIPHER_CTX* ctx, int type, int arg, void* ptr ) ;

FUNCTION: EVP_CIPHER* EVP_enc_null ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_des_ede3_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_desx_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_dev_crypto_des_ede3_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_dev_crypto_rc4 ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc4 ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc4_40 ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc4_hmac_md5 ( ) ;
FUNCTION: EVP_CIPHER* EVP_idea_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_idea_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_idea_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_idea_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_40_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_64_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc2_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_bf_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_bf_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_bf_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_bf_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_cast5_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_cast5_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_cast5_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_cast5_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc5_32_12_16_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc5_32_12_16_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc5_32_12_16_cfb64 ( ) ;
FUNCTION: EVP_CIPHER* EVP_rc5_32_12_16_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_ctr ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_ccm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_gcm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_xts ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_ctr ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_ccm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_192_gcm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_ctr ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_ccm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_gcm ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_xts ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_128_cbc_hmac_sha1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_aes_256_cbc_hmac_sha1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_128_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_192_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_cfb1 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_cfb8 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_camellia_256_ofb ( ) ;
FUNCTION: EVP_CIPHER* EVP_seed_ecb ( ) ;
FUNCTION: EVP_CIPHER* EVP_seed_cbc ( ) ;
FUNCTION: EVP_CIPHER* EVP_seed_cfb128 ( ) ;
FUNCTION: EVP_CIPHER* EVP_seed_ofb ( ) ;