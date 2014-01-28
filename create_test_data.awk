# create_test_data.awk
# purpose: to create radom values 
# usage: gawk -v digits=2 -v rows=300 -v columns=5 -f create_test_data.awk
# parameters:
#     digit: the number of digits we want to shift the decimal point shifts to the right
#     rows: number of rows we can to create
#     columns: number of random columns we desire
#     neg: include negative numbers 

function random(shift) {
  return rand() * (10 ** shift);
}

function flip(){
  return  int(rand() * 2); 
}

function generateNumber(shift, neg){
  result = random(shift); 
  sign = 1;
  
  if (neg && flip()){
   sign = -1; 
  }

  return sign * result; 
}

BEGIN {
  if (format == ""){ format = "f"; }
  if (digits == ""){ digits =  3; }
  if (rows == ""){ rows =  100; }
  if (columns == ""){ columns =  2; }
  if (neg == ""){neg = 1; }
 
  last_column = "%" format "\n";
  column = "%" format ",";

  for(i = 0; i < rows; i++) {
    for(j = 0; j < columns; j++){
      if (j + 1 >= columns){
        printf last_column, generateNumber(digits, neg);
      } else {
        printf column, generateNumber(digits, neg);
      }
    }
  }  
}
