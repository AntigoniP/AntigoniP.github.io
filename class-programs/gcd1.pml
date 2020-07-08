active proctype P() {
	byte a = 15;
    byte b = 20;
	do
	:: a > b ->
         a = a - b
	:: b > a ->
         b = b - a
	:: a == b ->
         break
	od
}







