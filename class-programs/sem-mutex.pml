byte sem = 1;
bool csp = false, csq = false;

ltl { []!(csp && csq) }

active proctype p() {	
  do :: 
    atomic {       /* Wait */
      sem > 0;     /* Wait */
      sem--        /* Wait */
    }              /* Wait */
    csp = true;
    csp = false;
    sem++          /* Signal */
  od
}

active proctype q() {	
  do :: 
    atomic {       /* Wait */
      sem > 0;     /* Wait */
      sem--        /* Wait */
    }              /* Wait */
    csp = true;
    csp = false;
    sem++          /* Signal */
  od
}
