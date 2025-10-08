(*
    Question 1

    Write a function min3 of type 
    int * int * int -> int that returns 
    the smallest of the three integers.
*)

fun min3 (x, y, z) =
    if x < y then
        if x < z then 
            x
        else
            z
    else
        if y < z then
            y
        else
            z

(*
    Question 2

    Write a function cycle of type ‘a list * int -> ‘a list 
    that takes a list and an integer as input and returns the 
    same list, but with the first element cycled to the end of 
    the list n times. For example, cycle ([1,2,3,4,5,6], 2)
    should return the list [3,4,5,6,1,2].
*)

fun cycle (list, n) =
    if n = 0 then (* Base case, cycling complete *)
        list
    else (* Recursively move 1st element to back of list *)
        cycle (tl list @ [hd list], n - 1)


(*  
    Question 3    
    
    Write a function isPrime of type int -> bool that returns 
    true if and only if its integer parameter is a prime number. 
    Your function need not behave well if the parameter is negative.
*)

fun isPrimeHelper(n, divisor) =
    if divisor * divisor > n then
        true
    else
        if n mod divisor = 0 then
            false
        else
            isPrimeHelper(n, divisor + 1)

fun isPrime(n) =
    if n < 3 then
        if n = 2 then
            true
        else
            false
    else
        isPrimeHelper(n, 2)


(*
    Write a function select of this type: ‘a list * (‘a -> bool) -> ‘a list 
    that takes a list and a function f as a parameter. Your function should 
    apply f to each element of the list and should return a new list 
    containing only those elements of the original list for which f returned 
    true. The elements of the new list can be given in any order. For example, 
    evaluating select ([1,2,3,4,5,6,7,8,9,10], is Prime) should result in a 
    list like [7,5,3,2].
*)

fun select(lst: 'a list, filter: 'a -> bool) =
    lst


(*
    Write a function band of type bool list -> bool that takes a list of Boolean 
    values and returns the logical OR of all of them. If the list is empty, your 
    function should return true
*)

fun logicalOr [] = false
  | logicalOr (x::xs) =
        if x = true then x
        else logicalOr(xs)


(*
    Write a function dupList of type ‘a list -> ‘a list whose output list is the 
    same as the input list, but with each element of the input list repeated twice 
    in a row. For example, if the input list is [1,3,2], the output list should be 
    [1,1,3,3,2,2]. If the input list is [], the output list should be [].
*)

fun dupList [] = []
  | dupList (x::xs) = [x, x] @ dupList(xs)


(*
    Write a function max of type int list -> int that returns the largest element 
    of a list of integers. Your function need not to behave well if the list is empty.
*)

fun maxInt [] = 0
  | maxInt (x::xs) = []


(*
Write a function convert of type (‘a * ‘b) list -> ‘a list * ‘b list, that converts a
list of pairs into a pair of lists, preserving the order of the elements. For example, convert [(1,2),
(3,4), (5,6)] should evaluate to ([1,3,5], [2,4,6]).
*)
