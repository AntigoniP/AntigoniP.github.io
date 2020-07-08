bool wantp = false, wantq = false;
byte critical = 0; 

active proctype p() {
    do 
    :: /* non critical section */
       wantp = true;
       !wantq;
       /* critical section */
       critical++;
       assert (critical == 1);
       critical--;
       wantp = false;
    od
}

active proctype q() {
    do 
    :: /* non critical section */
       wantq = true;
       !wantp;
       /* critical section */
       critical++;
       assert (critical == 1);
       critical--;
       wantq = false;
    od
}
