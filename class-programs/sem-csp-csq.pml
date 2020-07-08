byte sem = 1;
bool csp = false, csq = false;

active proctype p() {	
  do :: 
    atomic {
      sem > 0;
      sem--
    }
    csp = true;
    assert (! (csp && csq));
    csp = false;
    sem++
  od
}

active proctype q() {	
  do :: 
    atomic {
      sem > 0;
      sem--
    }
    csp = true;
    assert (! (csp && csq));
    csp = false;
    sem++
  od
}
