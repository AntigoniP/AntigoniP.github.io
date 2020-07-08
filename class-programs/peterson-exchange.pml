bool    wantP, wantQ;
byte    last = 1;
byte    critical = 0;

active proctype P() {
    do
    ::
    last = 1;
    wantP = true;
    (wantQ == false) || (last == 2);
    critical ++;
    assert(critical <= 1);
    critical --;
    wantP = false
    od
}

active proctype Q() {
    do
    ::
    last = 2;
    wantQ = true;
    (wantP == false) || (last == 1);
    critical ++;
    assert(critical <= 1);
    critical --;
    wantQ = false
    od
}
