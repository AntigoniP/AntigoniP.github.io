bool    wantp, wantq;
byte    last = 1;
bool csp = false, csq = false;

active proctype P() {
    do
    ::
    last = 1;
    wantp = true;
    (wantq == false) || (last == 2);
    csp = true;
    assert !csp || !csq;
    csp = false;
    wantp = false
    od
}

active proctype Q() {
    do
    ::
    last = 2;
    wantq = true;
    (wantp == false) || (last == 1);
    csq = true;
    assert !csp || !csq;
    csq = false;
    wantq = false
    od
}
