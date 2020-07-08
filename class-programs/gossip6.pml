byte k[6];  /* bit vector of gossips */
byte calls; /* number of telephone calls */

active proctype allgirls() {
  k[0] = 1; k[1] = 2; k[2] = 4; k[3]= 8; k[4] = 16; k[5] = 32;
  do
  :: atomic { k[0] != k[1] -> k[0]=k[0] | k[1]; k[1]=k[0]; calls++; }
  :: atomic { k[0] != k[2] -> k[0]=k[0] | k[2]; k[2]=k[0]; calls++; }
  :: atomic { k[0] != k[3] -> k[0]=k[0] | k[3]; k[3]=k[0]; calls++; }
  :: atomic { k[0] != k[4] -> k[0]=k[0] | k[4]; k[4]=k[0]; calls++; }
  :: atomic { k[0] != k[5] -> k[0]=k[0] | k[5]; k[5]=k[0]; calls++; }
  :: atomic { k[1] != k[2] -> k[1]=k[1] | k[2]; k[2]=k[1]; calls++; }
  :: atomic { k[1] != k[3] -> k[1]=k[1] | k[3]; k[3]=k[1]; calls++; }
  :: atomic { k[1] != k[4] -> k[1]=k[1] | k[4]; k[4]=k[1]; calls++; }
  :: atomic { k[1] != k[5] -> k[1]=k[1] | k[5]; k[5]=k[1]; calls++; }
  :: atomic { k[2] != k[3] -> k[2]=k[2] | k[3]; k[3]=k[2]; calls++; }
  :: atomic { k[2] != k[4] -> k[2]=k[2] | k[4]; k[4]=k[2]; calls++; }
  :: atomic { k[2] != k[5] -> k[2]=k[2] | k[5]; k[5]=k[2]; calls++; }
  :: atomic { k[3] != k[4] -> k[3]=k[3] | k[4]; k[4]=k[3]; calls++; }
  :: atomic { k[3] != k[5] -> k[3]=k[3] | k[5]; k[5]=k[3]; calls++; }
  :: atomic { k[4] != k[5] -> k[4]=k[4] | k[5]; k[5]=k[4]; calls++; }
  :: k[0] == 63 && k[1] == 63 && k[2] == 63 &&
     k[3] == 63 && k[4] == 63 && k[5] == 63 -> break
  od;
  printf("Calls = %d\n", calls);
  assert (calls > 2*6-4)
}

