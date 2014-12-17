! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: packages.syntax ;
IN: packages.example

PROJECT: example-project

VERSION: 0.1.0

DEPENDENCY: monoid
  GITHUB{ "andreaferretti" "factor-monoid" "0.1.0" } ;

DEPENDENCY: options
  GITHUB{ "andreaferretti" "factor-options" "0.1.0" } ;