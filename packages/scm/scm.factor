! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays io.directories io.launcher kernel
  packages.paths sequences strings words.symbol ;
IN: packages.scm

! A few word to construct dependencies

SYMBOL: git
SYMBOL: hg

TUPLE: dependency-ref
  { url string }
  { version string }
  { scm symbol initial: git } ;

C: <dependency-ref> dependency-ref

TUPLE: dependency
  { name string }
  { ref dependency-ref } ;

C: <dependency> dependency

PREDICATE: git-dependency < dependency
  ref>> scm>> git = ;

PREDICATE: hg-dependency < dependency
  ref>> scm>> hg = ;

<PRIVATE

: github-url ( user repo -- url )
  "https://github.com" -rot 3array
  "/" join ;

PRIVATE>

: <git> ( url version -- ref ) git <dependency-ref> ;

: <hg> ( url version -- ref ) hg <dependency-ref> ;

: <github> ( user repo version -- ref ) [ github-url ] dip <git> ;

! Generic words to manage dependencies

GENERIC: clone ( dependency -- )

GENERIC: fetch ( dependency -- )

GENERIC: checkout ( dependency -- )

: ensure ( dependency -- ) dup name>> package-exists? [ fetch ] [ clone ] if ;

: setup ( dependency -- ) dup ensure checkout ;

! SCM-specific implementations

<PRIVATE

: scm-clone ( dependency commands -- )
  swap
  [ ref>> url>> ]
  [ name>> directory-for-dep ]
  bi 2array append
  try-process ;

: scm-fetch ( dependency commands -- )
  [ name>> directory-for-dep ] dip
  [ try-process ] curry
  with-directory ;

: scm-checkout ( dependency commands -- )
  [ drop name>> directory-for-dep ]
  [ swap ref>> version>> suffix ] 2bi
  [ try-process ] curry
  with-directory ;

PRIVATE>

M: git-dependency clone { "git" "clone" } scm-clone ;

M: git-dependency fetch { "git" "fetch" } scm-fetch ;

M: git-dependency checkout { "git" "checkout" } scm-checkout ;

M: hg-dependency clone { "hg" "clone" } scm-clone ;

M: hg-dependency fetch { "hg" "pull" }  scm-fetch ;

M: hg-dependency checkout { "hg" "update" } scm-checkout ;