! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors io.files io.pathnames kernel namespaces parser
  sequences vocabs.files vocabs.loader ;
IN: packages.paths

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

: rel-directory-for-dep ( name -- path ) package-cache get prepend-path ;

PRIVATE>

: directory-for-dep ( name -- path ) rel-directory-for-dep absolute-path ;

: package-exists? ( name -- ? ) directory-for-dep exists? ;

: project-file ( name -- path ) rel-directory-for-dep "project.factor" append-path ;

<PRIVATE

: reset-vocab-roots ( -- ) default-roots vocab-roots set ;

PRIVATE>

: set-vocab-roots ( dependencies -- )
  reset-vocab-roots [ name>> rel-directory-for-dep add-vocab-root ] each ;