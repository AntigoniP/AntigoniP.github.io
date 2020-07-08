int x = 27;

ltl { !<>(x==1) }

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
