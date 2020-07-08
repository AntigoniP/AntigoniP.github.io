byte    n = 0;

active proctype P() {
	byte temp;
	temp = n + 1;
    n = temp;
}

active proctype Q() {
	byte temp;
	temp = n + 1;
    n = temp;
}
