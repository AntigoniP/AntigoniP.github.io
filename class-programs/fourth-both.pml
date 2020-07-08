bool wantP = false, wantQ = false;
bool csp = false, csq = false;

ltl mutex { [](!csp || !csq) }
ltl nostarve { []<>csp }

active proctype P() {
  do
  :: wantP = true;
     do
     :: wantQ -> wantP = false;
        wantP = true
     :: else -> break
     od;
     csp = true;
     csp = false;
     wantP = false
	od
}

active proctype Q() {	
	do 
	:: wantQ = true;
     do
     :: wantP -> wantQ = false;
        wantQ = true
     :: else -> break
     od;
     csq = true;
     csq = false;
     wantQ = false
	od
}
