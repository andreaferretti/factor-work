! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: crypto.aes grouping kernel sequences ;
IN: matasano.common.ecb

! : decrypt-ecb ( cypher key -- plaintext ) f EVP_aes_128_ecb decrypt ;

: encrypt-ecb ( plaintext key -- cypher ) swap
  16 <groups> [ aes-encrypt-block ] with map concat ;

: decrypt-ecb ( cypher key -- plaintext ) swap
  16 <groups> [ aes-decrypt-block ] with map concat ;