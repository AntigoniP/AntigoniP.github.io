/* Peterson's algorithm with LCR restriction */

bool wantp = false, wantq = false;
byte last = 1;
bool csp = false, csq = false;

ltl mutex { [](!csp || !csq) }
ltl nostarve { []<>csp && []<>csq }

active proctype p() {
    do ::
       wantp = true;
       last = 1;
       if :: !wantq 
          :: last == 2
       fi;
       csp = true;
       csp = false;
       wantp = false 
    od
}

active proctype q() {
    do ::
       wantq = true;
       last = 2;
       if
       :: !wantp 
       :: last == 1
       fi;
       csq = true;
       csq = false;
   wantq = false; 
    od
}

