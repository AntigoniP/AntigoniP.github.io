/* Manna and Pnueli's algorithm */

byte  wantp = 0, wantq = 0;
byte  critical = 0;

active proctype p() {
    do
    ::  atomic {
          if 
		    :: wantq == -1 -> wantp = -1 
			:: else -> wantp = 1 
		  fi;
        }
		wantq != wantp;
        critical++;
        printf("p in CS");
        assert (critical == 1);
	    critical--;
        wantp = 0
    od
}

active proctype q() {
    do
    ::  atomic {
          if 
			:: wantp == -1 -> wantq = 1 
			:: else -> wantq = -1 
		  fi;
        }
		wantp != - wantq;
        critical++;
        printf("q in CS");
        assert (critical == 1);
	    critical--;
        wantq = 0
    od
}
