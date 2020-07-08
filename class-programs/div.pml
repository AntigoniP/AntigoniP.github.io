/* Program for integer square root */

byte a = 18;
byte x = 0;

active proctype P() {
  do
  :: (x+1)*(x+1) <= a ->
       x = x + 1
  :: else   -> break
  od;

  assert 0 <= x*x &&
         x*x <= a &&
         a < (x+1)*(x+1)
}













/*
  assert 0 <= x*x && x*x <= a && a < (x+1)*(x+1)
*/