! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: matasano.common.crypto matasano.libcrypto ;
IN: matasano.set1.challenge7


: decrypt-ecb ( cypher key -- plaintext ) EVP_aes_128_ecb decrypt ;