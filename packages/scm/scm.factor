! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays io.directories io.launcher
  kernel packages.fs packages.projects sequences ;
IN: packages.scm

GENERIC: clone ( dependency -- )

GENERIC: fetch ( dependency -- )

GENERIC: checkout ( dependency -- )

: ensure ( dependency -- ) dup name>> package-exists? [ fetch ] [ clone ] if ;

: setup ( dependency -- ) dup ensure checkout ;

! SCM-specific implementations

<PRIVATE

: scm-clone ( dependency commands -- )
  swap
  [ url>> ]
  [ name>> directory-for-dep ]
  bi 2array append
  try-process ;

: scm-fetch ( dependency commands -- )
  [ name>> directory-for-dep ] dip
  [ try-process ] curry
  with-directory ;

: scm-checkout ( dependency commands -- )
  [ drop name>> directory-for-dep ]
  [ swap version>> suffix ] 2bi
  [ try-process ] curry
  with-directory ;

PRIVATE>

M: git-project clone { "git" "clone" } scm-clone ;

M: git-project fetch { "git" "fetch" } scm-fetch ;

M: git-project checkout { "git" "checkout" } scm-checkout ;

M: hg-project clone { "hg" "clone" } scm-clone ;

M: hg-project fetch { "hg" "pull" }  scm-fetch ;

M: hg-project checkout { "hg" "update" } scm-checkout ;

! Paths related to the SCM

GENERIC: scm-dir ( project -- path )

M: git-project scm-dir drop ".git" ;

M: hg-project scm-dir drop ".hg" ;