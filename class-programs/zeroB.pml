bool found = false;

inline f(x) {
  atomic {
    if
    :: x == 2  -> found = true
    :: else   -> found = false
    fi
  }
}

active proctype p() {
  int i = 0;
  do
  :: ! found ->
        i++;
        f(i)
  :: else -> break
  od
}

active proctype q() {
  int j = 1;
  do
  :: ! found ->
        j--;
        f(j)
  :: else -> break
  od
}
