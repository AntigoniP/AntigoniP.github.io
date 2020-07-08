bool    wantP, wantQ;
byte    last = 1;

active proctype P() {
    do
    ::
    wantP = true;
    last = 1;
    (wantQ == false) || (last == 2);
    /* Critical section */
    wantP = false
    od
}

active proctype Q() {
    do
    ::
    wantQ = true;
    last = 2;
    (wantP == false) || (last == 1);
    /* Critical section */
    wantQ = false
    od
}
