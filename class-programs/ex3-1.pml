byte n = 0;

active proctype p() {
  do
  :: n < 2 ->
       printf("n=%d\n", n)
  :: else   ->
       break
  od
}

active proctype q() {
  n++;
  n++
}
