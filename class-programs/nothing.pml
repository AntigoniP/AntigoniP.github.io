bool wantp = false, wantq = false;
bool csp = false, csq = false;

active proctype p() {
    do 
    :: wantq ->
         csp = true;
         assert(!(csp && csq));
         csp = false;
    :: !wantq ->
         csp = false
    od
}

active proctype q() {
    do 
    :: wantp ->
         csq = true;
         assert(!(csp && csq));
         csq = false;
    :: !wantp ->
         csq = false
    od
}
