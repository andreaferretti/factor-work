! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays assocs continuations grouping hashtables kernel math math.parser
  sequences sequences.windowed splitting ;
IN: options

<PRIVATE

: is-option? ( word -- ? ) "-" swap start ;

: is-long-option? ( word -- ? ) "--" swap start ;

: should-split? ( word -- ? ) [ is-option? ] [ "=" swap subseq? ] bi and ;

: split-option ( opt -- pieces ) dup should-split? [ "=" split1 2array ] [ 1array ] if ;

: apply-splits ( seq -- seq' ) [ split-option ] map concat ;

: should-add-default? ( pair-or-elt -- ? ) [ length 2 = ] [ [ is-option? ] all? ] bi and ;

: with-default ( pair -- pair-or-elt ) dup should-add-default? [ last t swap 2array ] [ last 1array ] if ;

: insert-defaults ( seq -- seq' )
  2 <windowed-sequence> [ with-default ] map concat
  dup length odd? [ t suffix ] when ;

: collect-as-map ( seq -- hashtable ) 2 <groups> >hashtable ;

: without-dash ( key -- key' ) dup is-long-option? [ 2 ] [ 1 ] if tail ;

: try-parsing ( value -- value' ) [ dup string>number [ ] [ ] ?if ] [ drop ] recover ;

: clean-keys-values ( hashtable -- hashtable' ) [ [ without-dash ] [ try-parsing ] bi* ] assoc-map ;

PRIVATE>

: parse-options ( opts -- hashtable ) apply-splits insert-defaults collect-as-map clean-keys-values ;