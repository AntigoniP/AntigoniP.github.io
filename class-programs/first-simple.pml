/* First attempt */
byte    turn = 1;
byte critical = 0; 

active proctype p() {
    do 
	:: /* non critical section */
       turn == 1;
       critical++;
       /* critical section */
       assert (critical == 1);
       critical--;
	   turn = 2;
    od
}

active proctype q() {
    do 
	:: /* non critical section */
       turn == 2;
       critical++;
       /* critical section */
       assert (critical == 1);
       critical--;
       turn = 1;
    od
}