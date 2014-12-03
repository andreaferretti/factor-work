! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: ascii kernel math.vectors sequences ;
IN: matasano.common.frequencies

CONSTANT: letters "ABCDEFGHIJKLMNOPQRSTUVWXYZ "

CONSTANT: frequencies {
  0.0651738 ! a
  0.0124248 ! b
  0.0217339 ! c
  0.0349835 ! d
  0.1041442 ! e
  0.0197881 ! f
  0.0158610 ! g
  0.0492888 ! h
  0.0558094 ! i
  0.0009033 ! j
  0.0050529 ! k
  0.0331490 ! l
  0.0202124 ! m
  0.0564513 ! n
  0.0596302 ! o
  0.0137645 ! p
  0.0008606 ! q
  0.0497563 ! r
  0.0515760 ! s
  0.0729357 ! t
  0.0225134 ! u
  0.0082903 ! v
  0.0171272 ! w
  0.0013692 ! x
  0.0145984 ! y
  0.0007836 ! z
  0.1918182 ! <space>
} ! from http://www.data-compression.com/english.html

: cosine-dist ( v w -- d ) [ normalize ] bi@ v. ;

<PRIVATE

: count-letter ( letter word -- n ) [ = ] with count ;

! outputs the frequency vector
: word-freqs ( word -- freqs ) >upper [ count-letter ] curry letters swap { } map-as ;

: letter-or-space? ( letter -- ? ) [ Letter? ] [ CHAR: \s = ] bi or ;

! outputs the frequency vector, including a final entry for unknown letters
: full-word-freqs ( word -- freqs )
  [ word-freqs ] [ [ letter-or-space? not ] count ] bi suffix ;

PRIVATE>

: score ( word -- x ) full-word-freqs frequencies cosine-dist ;