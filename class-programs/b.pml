byte  np = 0, nq = 0;
byte  critical  = 0;

active proctype p() {
	do
  :: nq > 254 -> break
  :: else ->
      np = nq + 1;
      ((nq == 0) || (np <= nq));
      critical++;
      assert (critical == 1);
      critical--;
      np = 0
  od
}

active proctype q() {
	do
  :: np > 254 -> break
  :: else ->
      nq = np + 1;
      ((np == 0) || (nq < np));
      critical++;
      assert (critical == 1);
      critical--;
      nq = 0
  od
}
