# create_geo_data.awk
# purpose: to create random lat/lon values 
# usage: gawk -v format=d -f create_geo_data.awk data_file
# parameters:
#     rows: how many rows you want. (Default is 100) 

function flip(){
  return  int(rand() * 2); 
}

function randomDegree(range, axis){
  direction["lat"][1] = "N";
  direction["lat"][-1] = "S";
  direction["lon"][1] = "E";
  direction["lon"][-1] = "W";
  
  degree = int(rand() * range); 
  decimal = rand(); 
  sign = 1;

  if (flip()){
      sign = -1; 
  }
  
  switch (format){
    case "dmd":
      result = degree " " (decimal * 60) "" direction[axis][sign];
      break;
    default:
      result = sign * degree + decimal;
  }

  return result;
}

function randomLat(){
  return randomDegree(90, "lat"); 
}

function randomLon(){
  return randomDegree(180, "lon"); 
}

{
    print $0 "," randomLat() "," randomLon();
}
