! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors combinators.smart io.directories kernel
  namespaces packages.fs packages.projects packages.scm sequences ;
IN: packages.publish

: clean-project ( project -- )
  [ name>> project-directory ] [ scm-dir ] bi clean-preserving ;

: copy-project ( project -- )
  [ name>> project-directory ] [ vocabs>> ] bi
  [ copy-vocab ] with each ;

: copy-project-def ( source project -- ) name>> project-file copy-file ;

: publish-project ( source project -- )
  [ clean-project ] preserving
  [ copy-project ] preserving
  [ copy-project-def ] preserving
  commit drop ;

: publish-current ( source -- ) current-project get publish-project ;