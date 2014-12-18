! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays kernel sequences strings words.symbol ;
IN: packages.projects

SYMBOL: git
SYMBOL: hg

TUPLE: project
  { name string }
  { url string }
  { version string }
  { scm symbol initial: git } ;

C: <project> project

PREDICATE: git-project < project
  scm>> git = ;

PREDICATE: hg-project < project
  scm>> hg = ;

TUPLE: local-project < project
  { vocabs sequence }
  { deps sequence } ;

C: <local-project> local-project

SYMBOL: current-project

<PRIVATE

: github-url ( user repo -- url )
  "https://github.com" -rot 3array
  "/" join ;

PRIVATE>

: <git> ( name url version -- ref ) git <project> ;

: <hg> ( name url version -- ref ) hg <project> ;

: <github> ( name user repo version -- ref ) [ github-url ] dip <git> ;