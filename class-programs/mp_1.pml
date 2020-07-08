int  wantp, wantq;
bool csp = false, csq = false;

active proctype P() {
    do
    ::
    atomic {
      if
      :: wantq = -1 -> wantp = -1
      :: else       -> wantp = 1
      fi
    }
    (wantq != wantp);
    csp = true;
    assert !csp || !csq;
    csp = false;
    wantp = 0
    od
}

active proctype Q() {
    do
    ::
    atomic {
      if
      :: wantp = -1 -> wantq = 1
      :: else       -> wantq = -1
      fi
    }
    (wantp != - wantq);
    csq = true;
    assert !csp || !csq;
    csq = false;
    wantq = 0
    od
}
