/* Compute maximum of two numbers
     nondeterministically */

byte a = 5, b = 5;
byte max;

active proctype P() {
	if
	:: a >= b ->
       max = a
	:: b >= a ->
       max = b
	fi;

    assert max >= a && max >= b;
}
