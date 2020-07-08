byte s = 1;
byte t = 0;

active proctype p() {
  printf("p\n");
  t++
}

active proctype q() {
  atomic { t > 0; t-- }
  printf("q\n");
  s++
}
