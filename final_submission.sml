(*
    Question 1

    Write a function min3 of type 
    int * int * int -> int that returns 
    the smallest of the three integers.
*)

fun min3 (a, b, c) =
    if a <= b then
        if a <= c then a else c
    else
        if b <= c then b else c;
(*
    Question 2

    Write a function cycle of type ‘a list * int -> ‘a list 
    that takes a list and an integer as input and returns the 
    same list, but with the first element cycled to the end of 
    the list n times. For example, cycle ([1,2,3,4,5,6], 2)
    should return the list [3,4,5,6,1,2].
*)

fun cycle (list: 'a list, n: int) : 'a list =
  if n = 0 then list
  else cycle (tl list@[hd list], n - 1);

fun cycle2 ([], _) = []
  | cycle2 (x::xs, n) =
      if n < 1 then x::xs
      else cycle2 (tl list@[hd list], n - 1);


(*  
    Question 3    
    
    Write a function isPrime of type int -> bool that returns 
    true if and only if its integer parameter is a prime number. 
    Your function need not behave well if the parameter is negative.
*)

fun isPrime n =
    let
        fun hasDivisor (d, n) =
            if d * d > n then false
            else if n mod d = 0 then true
            else hasDivisor (d + 1, n)
    in
        if n <= 1 then false
        else if hasDivisor (2, n) then false
        else true
    end;

(*
    Write a function select of this type: ‘a list * (‘a -> bool) -> ‘a list 
    that takes a list and a function f as a parameter. Your function should 
    apply f to each element of the list and should return a new list 
    containing only those elements of the original list for which f returned 
    true. The elements of the new list can be given in any order. For example, 
    evaluating select ([1,2,3,4,5,6,7,8,9,10], is Prime) should result in a 
    list like [7,5,3,2].
*)

fun select (lst, f) =
    case lst of
        [] => []
      | x::xs => if f x then x :: select(xs, f)
                 else select(xs, f);

fun select2([], _) = []
  | select2(x::xs, filter) =
      if filter x then x::select2(xs, filter)
      else select2(xs, filter) 


(*
    Write a function band of type bool list -> bool that takes a list of Boolean 
    values and returns the logical OR of all of them. If the list is empty, your 
    function should return true
*)

fun band [] = true
  | band (x::[])= x
  | band (x::xs) = x orelse band xs;

(*
    Write a function dupList of type ‘a list -> ‘a list whose output list is the 
    same as the input list, but with each element of the input list repeated twice 
    in a row. For example, if the input list is [1,3,2], the output list should be 
    [1,1,3,3,2,2]. If the input list is [], the output list should be [].
*)

fun dupList [] = []
  | dupList (x::xs) = x :: x :: dupList xs;


(*
    Write a function max of type int list -> int that returns the largest element 
    of a list of integers. Your function need not to behave well if the list is empty.
*)

fun max [x] = x
  | max (x :: xs) =
      let
        val m = max xs
      in
        if x > m then x else m
      end;




(*
    Write a function convert of type (‘a * ‘b) list -> ‘a list * ‘b list, that converts 
    a list of pairs into a pair of lists, preserving the order of the elements. For 
    example, convert [(1,2), (3,4), (5,6)] should evaluate to ([1,3,5], [2,4,6]).
*)

fun convert xs =
  foldr (fn ((a, b), (listA, listB)) => (a :: listA, b :: listB)) ([], []) xs;


(*
    A binary search tree is a binary tree with special properties. It may be Empty. It may be a Node
    containing a left subtree, a data item x, and a right subtree. 1n this case all the data items in the tree are
    different, all the items in the left subtree are smaller than x, all the items in the right subtree are greater
    than x, and the left and right subtrees arc also binary search trees. Write a function makeBST of type
    'a list → ('a * 'a → bool) → 'a tree
    that organizes the items in the list into a binary search tree. The tree need not be balanced. You may
    assume that no item in the tree is repeated
*)

datatype 'a tree = 
    Empty
  | Node of 'a * 'a tree * 'a tree

fun insertBST (cmp, (x, Empty)) = Node(x, Empty, Empty)
  | insertBST (cmp, (x, Node(v, l, r))) =
    if cmp(x, v) then Node(v, insertBST (cmp, (x, l)), r)
    else Node(v, l, insertBST (cmp, (x, r)))

fun makeBST (cmp, []) = Empty
  | makeBST (cmp, x::xs) = insertBST (cmp, (x, makeBST (cmp, xs)))
      


 (* Usage Examples *)     

fun makeIntBST [] = Empty 
  | makeIntBST lst as (_::_) =
      makeBST ((fn (x, y) => x < y), lst)


(*
    Write a function searchBST of type
    ''a tree → (''a * ''a → bool) → ''a → bool
    that searches a binary search tree for a given data element. Refer to Exercise 5 for the definition of a
    binary search tree. You should not search every node in the tree, but only those nodes that,
    according to the definition, might contain the element you are looking for.
*)