/* Peterson's Algorithm */

bool    wantP, wantQ;
byte    last = 1;
bool csp = false, csq = false;

ltl { [](!csp || !csq) }

active proctype P() {
    do
    ::  wantP = true;
        last = 1;
        (wantQ == false) || (last == 2);
        /* Critical section */
        csp = true;
        csp = false;
        wantP = false
    od
}

active proctype Q() {
    do
    ::  wantQ = true;
        last = 2;
        (wantP == false) || (last == 1);
        /* Critical section */
        csq = true;
        csq = false;
        wantQ = false
    od
}
