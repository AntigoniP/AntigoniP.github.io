byte i[10];
byte h;
active proctype FA() {
  i[0] = 'a';
  i[1] = 'a';
  i[2] = 'a';
  i[3] = 'b';
  i[4] = 'b';
  i[5] = 'b';
  i[6] = 'b';
  i[7] = 'b';
  i[8] = 'b';
  i[9] = '.';
  goto q0;

q0:
  if
  :: i[h] == 'a' -> h++; goto q1
  :: else        -> goto reject
  fi;  

q1:
  if
  :: i[h] == 'a' -> h++; goto q2
  :: i[h] == 'a' -> h++; goto q9
  :: else        -> goto reject
  fi;

q2:
  if
  :: i[h] == 'a' -> h++; goto q3
  :: else        -> goto reject
  fi;

q3:
  if
  :: true        -> goto q6
  :: true        -> goto q11
  :: i[h] == 'a' -> h++; goto q4
  :: else        -> goto reject
  fi;

q4:
  if
  :: i[h] == 'a' -> h++; goto q5
  :: else        -> goto reject
  fi;

q5:
  if
  :: i[h] == 'a' -> h++; goto q3
  :: else        -> goto reject
  fi;

q6:
  if
  :: i[h] == 'b' -> h++; goto q7
  :: i[h] == '.' -> goto accept
  :: else        -> goto reject
  fi;

q7:
  if
  :: i[h] == 'b' -> h++; goto q8
  :: else        -> goto reject
  fi;

q8:
  if
  :: i[h] == 'b' -> h++; goto q6
  :: else        -> goto reject
  fi;

q9:
  if
  :: true        -> goto q6
  :: true        -> goto q11
  :: i[h] == 'a' -> goto q10
  :: else        -> goto reject
  fi;

q10:
  if
  :: i[h] == 'a' -> h++; goto q9
  :: else        -> goto reject
  fi;

q11:
  if
  :: i[h] == 'b' -> h++; goto q12
  :: i[h] == '.' -> goto accept
  :: else        -> goto reject
  fi;

q12:
  if
  :: i[h] == 'b' -> h++; goto q11
  :: else        -> goto reject
  fi;

accept:
  printf("**Accepted!\n");
  assert(false);

reject:
    printf("**Rejected ...\n");
}
