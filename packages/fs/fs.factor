! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors io.directories io.directories.hierarchy
  io.files io.files.info io.pathnames kernel math.order namespaces
  parser sequences vocabs.files vocabs.loader ;
IN: packages.fs

CONSTANT: default-package-cache "resource:cache"

CONSTANT: default-roots V{
  "resource:core"
  "resource:basis"
  "resource:extra"
  "resource:work"
}

SYMBOL: package-cache

! We set the default package cache
default-package-cache package-cache set-global

<PRIVATE

: rel-project-directory ( name -- path ) package-cache get prepend-path ;

PRIVATE>

: project-directory ( name -- path ) rel-project-directory absolute-path ;

: project-exists? ( name -- ? ) project-directory exists? ;

: project-file ( name -- path ) rel-project-directory "project.factor" append-path ;

: contains-dir? ( base dir -- ? ) append-path exists? ;

<PRIVATE

: min-length ( seq1 seq2 -- n ) [ length ] bi@ min ;

: common-head-els ( seq1 seq2 -- i ) [ mismatch ] [ min-length ] 2bi or ;

PRIVATE>

: relative-path ( from to -- path )
  [ path-components ] bi@
  2dup common-head-els
  [ tail [ drop ".." ] map ] [ tail ] bi-curry
  bi* append
  path-separator join ; inline

<PRIVATE

: copy-relative-to ( to from path -- )
  dup
  [ relative-path append-path ] dip
  swap copy-file ;

: (clean-preserving) ( path preserving -- )
  [
    [
      over start
      [ drop ] [
        dup file-info regular-file?
        [ delete-file ] [ drop ] if
      ] if
    ] curry each
  ] curry with-directory-tree-files ;

PRIVATE>

: copy-vocab ( dest vocab -- )
  [ find-vocab-root ]
  [ vocab-files [ exists? ] filter ] bi
  [ copy-relative-to ] 2with each ;

: clean-preserving ( path preserving -- )
  over exists? [ (clean-preserving) ] [ 2drop ] if ;

<PRIVATE

: reset-vocab-roots ( -- ) default-roots vocab-roots set ;

PRIVATE>

: set-vocab-roots ( dependencies -- )
  reset-vocab-roots [ name>> rel-project-directory add-vocab-root ] each ;