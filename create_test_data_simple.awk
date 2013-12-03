function random(shift) {
  return rand() * (10 ** shift);
}

BEGIN {
  rows = 100;
  columns = 2;
  for(i = 0; i < rows; i++) {
    for(j = 0; j < columns; j++){
      if (j + 1 >= columns){
        printf "%d\n", random(4);
      } else {
        printf "%d,", random(4);
      }
    }
  }  
}
