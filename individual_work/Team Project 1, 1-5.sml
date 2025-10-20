(* 1. min3: returns the smallest of three integers *)
(*using or others*)
fun min3 (a, b, c) =
    if a <= b then
        if a <= c then a else c
    else
        if b <= c then b else c;

val test_min3 = min3 (10, 5, 8);
val test_min3 = min3 (20, 15, 11)

(* 2. cycle: moves the first element to the end n times *)
(* not using *)
fun cycle (lst, n) =
    let
        fun rotate [] = []
          | rotate (x::xs) = xs @ [x]
        fun repeat (l, 0) = l
          | repeat (l, k) = repeat (rotate l, k - 1)
    in
        repeat (lst, n)
    end;

val test_cycle = cycle ([1,2,3,4,5,6], 2);
val test_cycle = cycle ([1,2,3,4,5,6], 4);

(* 3. isPrime: returns true if the number is prime *)
(*using*)
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

val test_isPrime1 = isPrime 7;
val test_isPrime2 = isPrime 10;

(* 4. select: returns elements for which f(x) = true *)
(* i think we are using *)
fun select (lst, f) =
    case lst of
        [] => []
      | x::xs => if f x then x :: select(xs, f)
                 else select(xs, f);

val test_select = select ([1,2,3,4,5,6,7,8,9,10], isPrime);

(* 5. band: returns logical OR of all booleans.
   If the list is empty, return true. *)
(*using*)
fun band lst =
    case lst of
        [] => true
      | x::xs => if x then true else band xs;

val test_band1 = band [false, false, false, false];
val test_band2 = band [];
val test_band3 = band [false, false, false];        
