byte x = 4;

ltl { []<>(x>=4) }

active proctype A() {
  do
  :: x % 2 -> x = 3 * x + 1
  od
}

active proctype B() {
  do
  :: !(x % 2) -> x = x / 2
  od
}


