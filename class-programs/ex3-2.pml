int n = 0;

active proctype p() {
  do
  :: n < 1 ->
       n++
  :: else   ->
       break
  od
}

active proctype q() {
  do
  :: n >= 0 ->
       n--
  :: else   ->
       break
  od
}
