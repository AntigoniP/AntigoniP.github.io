bool found = false;
byte turn  = 1;

inline f(x) {
  atomic {
    if
    :: x == 2  -> found = true
    :: else    -> found = false
    fi
  }
}

active proctype p() {
  int i = 0;
  do
  :: ! found ->
        atomic { turn == 1; turn = 2 }
        i++;
        f(i)
  :: else -> break
  od;
  turn = 2
}

active proctype q() {
  int j = 1;
  do
  :: ! found ->
        atomic { turn == 2; turn = 1 }
        j--;
        f(j)
  :: else -> break
  od;
  turn = 1
}
