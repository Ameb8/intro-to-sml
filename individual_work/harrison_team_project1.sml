(*All the same*)
fun min3 (num1:int, num2:int, num3:int) : int =
  if (num1 < num2) then
    if num1 < num3 then num1
    else num3
  else if num2 < num3 then num2
  else num3;

(*2 the same*)
fun cycle (list: 'a list, n: int) : 'a list =
  if n = 0 then list
  else cycle (tl list@[hd list], n - 1);

(*Use Jeshua's*)
fun Prime(n:int, m:int) : bool =
  if m = 1 then true
  else if n mod m = 0 then false
  else Prime(n, m-1);
fun isPrime (n:int) : bool =
  if n < 2 then false
  else Prime(n, n -1);

(*Use Jeshua's*)
fun select (list: 'a list, f: 'a -> bool) : 'a list =
  if null list then []
  else if f(hd list) then hd list::select(tl list, f)
  else select(tl list, f);

(*Use Mine *)
fun band [] = true
  | band (x::[])= x
  | band (x::xs) = x orelse band xs;

(*Use Jeshua's*)
fun dupList [] = []
  | dupList (x::xs) = x::x::dupList xs;

(*Use either*)
fun max (x::[] : int list) = x
  | max (x::xs) =
    let
      val y = max xs;
    in
      if x > y then x
      else y
    end;

(*Use Jeshua's*)
fun convert (x::[] : ('a * 'b) list) : ('a list * 'b list) = ([#1 x], [#2 x])
  | convert (x::xs) =
    let
      val converted = convert(xs);
      val x1 = #1 x;
      val x2 = #2 x;
      val xs1 = #1 converted;
      val xs2 = #2 converted;
    in
      (x1::xs1, x2::xs2)
    end;

(*Use yours for the last 2 thanks :)*)