! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel lexer namespaces packages
  packages.scm parser sequences ;
IN: packages.syntax

<PRIVATE

: new-project ( name -- project ) project new swap >>name ;

: add-dependency ( project dep -- project ) [ dup deps>> ] dip suffix >>deps ;

: add-vocab ( project vocab -- project ) [ dup vocabs>> ] dip suffix >>vocabs ;

: add-vocabs ( project vocabs -- project ) [ dup vocabs>> ] dip append >>vocabs ;

: parse-dependency ( -- dep ) scan-token \ ; parse-until first <dependency> ;

PRIVATE>

SYNTAX: PROJECT: scan-token new-project current-project set-global ;

SYNTAX: VERSION: scan-token current-project get swap >>version drop ;

SYNTAX: SCM: scan-word current-project get swap >>scm drop ;

SYNTAX: VOCAB: scan-token current-project get swap add-vocab drop ;

SYNTAX: VOCABS: ";" parse-tokens current-project get swap add-vocabs drop ;

SYNTAX: GIT{ \ } [ first2 <git> ] parse-literal ;

SYNTAX: HG{ \ } [ first2 <hg> ] parse-literal ;

SYNTAX: GITHUB{ \ } [ first3 <github> ] parse-literal ;

SYNTAX: DEPENDENCY: parse-dependency current-project get swap add-dependency drop ;