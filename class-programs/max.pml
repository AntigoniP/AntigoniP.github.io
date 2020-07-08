/* Compute maximum of two numbers
     nondeterministically */

byte a = 5, b = 5;
byte max;
byte branch;

active proctype P() {
	if
	:: a >= b -> max = a; branch = 1;
	:: b >= a -> max = b; branch = 2;
	fi;

	printf("The maximum of %d and %d = %d by branch %d\n",
			a, b, max, branch);

    assert max >= a && max >= b;
}
