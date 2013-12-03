# create_geo_data.awk
# purpose: to create random lat/lon values 
# usage: gawk -v rows=300 -v format=d -f create_geo_data.awk
# parameters:
#     rows: how many rows you want. (Default is 100) 

function flip(){
  return  int(rand() * 2); 
}

function randomDegree(range){
  degree = int(rand() * range); 
  decimal = rand(); 
  sign = 1;

  if (flip()){
      sign = -1; 
  }
  
  switch (format){
    case "dmd":
      result = (sign * degree) " " (decimal * 60);
      break;
    default:
      result = sign * degree + decimal;
  }

  return result;
}

function randomLat(){
  return randomDegree(90); 
}

function randomLon(){
  return randomDegree(180); 
}

BEGIN {
  if (rows == ""){ rows =  100; }
  if (format == ""){ format = "decimal"; }
 
  for(i = 0; i < rows; i++) {
    print randomLat() "," randomLon();
  }  
}
