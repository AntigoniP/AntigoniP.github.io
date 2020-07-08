int n = 0;
byte finished = 0;

active proctype P() {
  int temp;
  byte k = 0;
  do
  :: k == 5 -> break
  :: else   ->
       temp = n;
       n = temp + 1;
       k++
  od;
  finished++
}

active proctype Q() {
  int temp;
  byte k = 0;
  do
  :: k == 5 -> break
  :: else   ->
       temp = n;
       n = temp - 1;
       k++
  od;
  finished++
}

active proctype F() {
  finished == 2;
  assert n >= -5 && n <= 5;
  assert n*n <= 25
}