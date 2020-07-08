bool wantP = false, wantQ = false;
bool csp = false, csq = false;

active proctype P() {
  do
  :: wantP = true;
     do
     :: wantQ  -> wantP = false;
                 wantP = true
     :: !wantQ -> break
     od;
     csp = true;
     assert !(csp && csq);
     csp = false;
     wantP = false
	od
}

active proctype Q() {	
	do 
	:: wantQ = true;
     do
     :: wantP  -> wantQ = false;
                 wantQ = true
     :: !wantP -> break
     od;
     csq = true;
     assert !(csp && csq);
     csq = false;
     wantQ = false
	od
}
