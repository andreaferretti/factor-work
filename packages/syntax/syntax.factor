! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel lexer namespaces packages
  packages.projects parser sequences ;
IN: packages.syntax

<PRIVATE

: new-project ( name -- project ) local-project new swap >>name ;

: add-dependency ( project dep -- project ) [ dup deps>> ] dip suffix >>deps ;

: add-vocab ( project vocab -- project ) [ dup vocabs>> ] dip suffix >>vocabs ;

: add-vocabs ( project vocabs -- project ) [ dup vocabs>> ] dip append >>vocabs ;

PRIVATE>

SYNTAX: PROJECT: scan-token new-project current-project set-global ;

SYNTAX: VERSION: scan-token current-project get swap >>version drop ;

SYNTAX: SCM: scan-word current-project get swap >>scm drop ;

SYNTAX: URL: scan-token current-project get swap >>url drop ;

SYNTAX: VOCAB: scan-token current-project get swap add-vocab drop ;

SYNTAX: VOCABS: ";" parse-tokens current-project get swap add-vocabs drop ;

SYNTAX: GIT-DEP: ";" parse-tokens first3 <git> current-project get swap add-dependency drop ;

SYNTAX: HG-DEP: ";" parse-tokens first3 <hg> current-project get swap add-dependency drop ;

SYNTAX: GITHUB-DEP: ";" parse-tokens first4 <github> current-project get swap add-dependency drop ;