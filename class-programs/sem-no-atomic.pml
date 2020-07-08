byte sem = 1;
byte critical = 0;

active proctype p() {	
  do :: 
    sem > 0;
    sem--;
    critical++;
    assert(critical == 1);
    critical--;
    sem++
  od
}

active proctype q() {	
  do :: 
    sem > 0;
    sem--;
    critical++;
    assert(critical == 1);
    critical--;
    sem++
  od
}
