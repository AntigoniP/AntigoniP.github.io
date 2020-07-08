byte k[4];  /* bit vector of gossips */
byte calls; /* number of telephone calls */

active proctype allgirls() {
  k[0] = 1; k[1] = 2; k[2] = 4; k[3]= 8;
  do
  :: atomic { k[0] != k[1] -> k[0]=k[0] | k[1]; k[1]=k[0]; calls++; }
  :: atomic { k[0] != k[2] -> k[0]=k[0] | k[2]; k[2]=k[0]; calls++; }
  :: atomic { k[0] != k[3] -> k[0]=k[0] | k[3]; k[3]=k[0]; calls++; }
  :: atomic { k[1] != k[2] -> k[1]=k[1] | k[2]; k[2]=k[1]; calls++; }
  :: atomic { k[1] != k[3] -> k[1]=k[1] | k[3]; k[3]=k[1]; calls++; }
  :: atomic { k[2] != k[3] -> k[2]=k[2] | k[3]; k[3]=k[2]; calls++; }
  :: k[0] == 15 && k[1] == 15 && k[2] == 15 && k[3] == 15 -> break
  od;
  printf("Calls = %d\n", calls);
  assert (calls > 2*4-4)
}

