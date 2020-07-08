byte k[5];  /* bit vector of gossips */
byte calls; /* number of telephone calls */

active proctype allgirls() {
  k[0] = 1; k[1] = 2; k[2] = 4; k[3]= 8; k[4] = 16;
  do
  :: atomic { k[0] != k[1] -> k[0]=k[0] | k[1]; k[1]=k[0]; calls++; }
  :: atomic { k[0] != k[2] -> k[0]=k[0] | k[2]; k[2]=k[0]; calls++; }
  :: atomic { k[0] != k[3] -> k[0]=k[0] | k[3]; k[3]=k[0]; calls++; }
  :: atomic { k[0] != k[4] -> k[0]=k[0] | k[4]; k[4]=k[0]; calls++; }
  :: atomic { k[1] != k[2] -> k[1]=k[1] | k[2]; k[2]=k[1]; calls++; }
  :: atomic { k[1] != k[3] -> k[1]=k[1] | k[3]; k[3]=k[1]; calls++; }
  :: atomic { k[1] != k[4] -> k[1]=k[1] | k[4]; k[4]=k[1]; calls++; }
  :: atomic { k[2] != k[3] -> k[2]=k[2] | k[3]; k[3]=k[2]; calls++; }
  :: atomic { k[2] != k[4] -> k[2]=k[2] | k[4]; k[4]=k[2]; calls++; }
  :: atomic { k[3] != k[4] -> k[3]=k[3] | k[4]; k[4]=k[3]; calls++; }
  :: k[0] == 31 && k[1] == 31 && k[2] == 31 && k[3] == 31 && k[4] == 31 -> break
  od;
  printf("Calls = %d\n", calls);
  assert (calls > 2*5-4)
}

