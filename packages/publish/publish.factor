! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel namespaces packages.fs packages.projects
  packages.scm sequences ;
IN: packages.publish

: copy-project ( project -- )
  [ name>> directory-for-dep ] [ vocabs>> ] bi
  [ copy-vocab ] with each ;

: clean-project ( project -- )
  [ name>> directory-for-dep ] [ scm-dir ] bi clean-preserving ;

: commit-project ( project -- ) drop ;

: publish-project ( project -- )
  dup clean-project
  dup copy-project commit-project ;

: publish-current ( -- ) current-project get publish-project ;