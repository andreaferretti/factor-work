! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: crypto.aes grouping io.encodings.ascii
  io.encodings.string kernel sequences ;
IN: matasano.set1.challenge7


! : decrypt-ecb ( cypher key -- plaintext ) f EVP_aes_128_ecb decrypt ;

: decrypt-ecb ( cypher key -- plaintext ) swap
  16 <groups> [ aes-decrypt-block ] with map concat
  ascii decode ;