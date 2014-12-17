! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays fry io.directories io.launcher kernel
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

M: git-dependency clone
  [ ref>> url>> ]
  [ name>> directory-for-dep ]
  bi 2array { "git" "clone" } prepend
  try-process ;

M: git-dependency fetch
  name>> directory-for-dep
  [ { "git" "fetch" } try-process ]
  with-directory ;

M: git-dependency checkout
  [ name>> directory-for-dep ] [ ref>> version>> ] bi
  '[ { "git" "checkout" } _ suffix try-process ]
  with-directory ;

M: hg-dependency clone
  [ ref>> url>> ]
  [ name>> directory-for-dep ]
  bi 2array { "hg" "clone" } prepend
  try-process ;

M: hg-dependency fetch
  name>> directory-for-dep
  [ { "hg" "pull" } try-process ]
  with-directory ;

M: hg-dependency checkout
  [ name>> directory-for-dep ] [ ref>> version>> ] bi
  '[ { "hg" "update" } _ suffix try-process ]
  with-directory ;