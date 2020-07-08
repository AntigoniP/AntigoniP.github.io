byte x = 4;

/* Correctness claim []<>(x>=4)  or []<>!(x<4) */
/* Negation is <>[](x<4) */

ltl { []<>!(x<4) }

active proctype A1() {
  do
  :: (x % 2) == 1 ->
       x = 3 * x + 1
  od
}

active proctype A2() {
  do
  :: (x % 2) == 0 ->
       x = x / 2
  od
}
