bool found;

inline f(x) {
  atomic {
    if
    :: x == 2 -> found = true
    :: else   -> found = false
    fi
  }
}

active proctype p() {
  int i = 0;
  found = false;
  do
  :: ! found ->
        i++;
        f(i)
  :: else -> break
  od
}

active proctype q() {
  int j = 1;
  found = false;
  do
  :: ! found ->
        j--;
        f(j)
  :: else -> break
  od
}
