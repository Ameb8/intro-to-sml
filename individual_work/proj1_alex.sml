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
