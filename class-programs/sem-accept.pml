byte sem = 1;
bool csp = false;

ltl { []<>csp }

active proctype p() {	
  do :: 
    atomic {
      sem > 0;
      sem--
    }
    csp = true;
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
    sem++
  od
}
