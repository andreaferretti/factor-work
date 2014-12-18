! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel namespaces packages.fs packages.scm
  parser sequences strings vocabs vocabs.loader words.symbol ;
IN: packages

TUPLE: project
  { name string }
  { version string }
  { scm symbol initial: git }
  { vocabs sequence }
  { deps sequence } ;

C: <project> project

SYMBOL: current-project

<PRIVATE

DEFER: activate-file

: setup-deps ( project -- ) deps>> [ setup ] each ;

: setup-roots ( project -- ) deps>> set-vocab-roots ;

: setup-requirements ( project -- ) vocabs>> [ require ] each ;

: setup-recursive ( project -- )
  deps>> [ name>> project-file activate-file ] each ;

: setup ( project -- )
  dup setup-deps
  dup setup-roots
  dup setup-recursive
  setup-requirements ;

: activate-file ( path -- )
  run-file current-project get setup ;

PRIVATE>

: activate ( vocab -- ) vocab-source-path activate-file ;