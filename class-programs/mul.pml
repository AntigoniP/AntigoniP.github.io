/* Program for multiplication */

byte a = 6;
byte b = 4;

byte x = 0;
byte y = b;

active proctype P() {
  do
  :: y != 0 ->
       x = x + a;
       y = y - 1
  :: else   -> break
  od;

  assert x == a * b
}