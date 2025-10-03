(*
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
