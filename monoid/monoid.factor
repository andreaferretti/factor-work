! Copyright (C) 2014 Andrea Ferretti.
! See http://factorcode.org/license.txt for BSD license.
USING: arrays assocs hashtables kernel math quotations sequences strings ;
IN: monoid

GENERIC: |+| ( a b -- c )

<PRIVATE

: sum-key ( key h1 h2 -- sum ) rot [ of ] curry bi@ |+| ;

: with-identity ( quot: ( x -- y ) -- quot': ( x -- x y ) )
  [ dup ] prepose ; inline

: sum-common-keys ( h1 h2 -- union )
  [ assoc-intersect keys ]
  [ [ sum-key ] 2curry ]
  2bi with-identity
  H{ } map>assoc ;

PRIVATE>

M: fixnum |+| + ;
M: float |+| + ;
M: sequence |+| 2array concat ;
M: hashtable |+| 2dup sum-common-keys assoc-union assoc-union ;
M: quotation |+| [ bi |+| ] 2curry ;
