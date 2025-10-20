(*Question 6*)
(* using *)
fun dupList [] = []
  | dupList (x::xs) = x :: x :: dupList xs;

(*Example*)
dupList [1,2,3,4];
dupList [];

(* 7. max *)
(* not sure if using *)
fun max [x] = x
  | max (x :: xs) =
      let
        val m = max xs
      in
        if x > m then x else m
      end;

(*Example*)
max [5, 2, 9, 1];

(* 8. convert *)
(* using *)
fun convert xs =
  foldr (fn ((a, b), (listA, listB)) => (a :: listA, b :: listB)) ([], []) xs;

(*Example*)
convert [(1,2), (3,4), (5,6)];





