! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays io.directories io.launcher
  kernel packages.fs packages.projects sequences ;
IN: packages.scm

GENERIC: clone ( project -- )

GENERIC: fetch ( project -- )

GENERIC: checkout ( project -- )

GENERIC: ensure-init ( project -- )

GENERIC: init ( project -- )

GENERIC: commit-all ( project -- )

GENERIC: tag ( project -- )

GENERIC: push ( project -- )

GENERIC: scm-dir ( project -- path )

: ensure ( project -- ) dup name>> project-exists? [ fetch ] [ clone ] if ;

: setup ( project -- ) dup ensure checkout ;

: commit ( project -- )
  dup ensure-init
  dup commit-all
  dup tag
  dup url>> empty? [ drop ] [ push ] if ;

! SCM-specific implementations

<PRIVATE

: scm-clone ( project commands -- )
  swap
  [ url>> ]
  [ name>> project-directory ]
  bi 2array append
  try-process ;

: execute-in-context ( project commands -- )
  [ name>> project-directory ] dip
  [ try-process ] curry
  with-directory ;

: execute-all-in-context ( project commands -- ) [ execute-in-context ] with each ;

: already-init? ( project -- ? )
  [ name>> project-directory ] [ scm-dir ] bi contains-dir? ;

: scm-ensure-init ( project -- )
  dup already-init? [ drop ] [ init ] if ;

: scm-checkout ( project commands -- )
  [ drop name>> project-directory ]
  [ swap version>> suffix ] 2bi
  [ try-process ] curry
  with-directory ;

PRIVATE>

! Git

M: git-project init { "git" "init" } execute-in-context ;

M: git-project clone { "git" "clone" } scm-clone ;

M: git-project fetch { "git" "fetch" } execute-in-context ;

M: git-project checkout { "git" "checkout" } scm-checkout ;

M: git-project ensure-init scm-ensure-init ;

M: git-project commit-all
  {
    { "git" "add" "--all" }
    { "git" "commit" "-m" "auto-commit" }
  } execute-all-in-context ;

M: git-project tag
  dup version>> { "git" "tag" } swap suffix execute-in-context ;

M: git-project push
  dup url>> { "git" "push" } swap suffix execute-in-context ;

M: git-project scm-dir drop ".git" ;

! Hg

M: hg-project clone { "hg" "clone" } scm-clone ;

M: hg-project fetch { "hg" "pull" }  execute-in-context ;

M: hg-project checkout { "hg" "update" } scm-checkout ;

M: hg-project scm-dir drop ".hg" ;