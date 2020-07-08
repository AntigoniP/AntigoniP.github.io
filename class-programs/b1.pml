byte  np = 0, nq = 0;
byte  critical  = 0;

active proctype p() {
	do
    ::
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
    ::
      nq = np + 1;
      ((np == 0) || (nq < np));
      critical++;
      assert (critical == 1);
      critical--;
      nq = 0
  od
}
