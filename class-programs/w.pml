byte s = 1;
bool b = false;

active proctype p() {
  atomic { s > 0; s-- }
  b = true;
  s++
}

active proctype q() {
  atomic { s > 0; s-- }
  do
  :: !b   -> printf("*\n")
  :: else -> break
  od;
  s++
}
