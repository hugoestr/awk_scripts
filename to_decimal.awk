# usage: gawk -v lat=lat_column -v lon=lon_column -f to_decimal.awk  <csv file name>

function decompose(value, result){
  size = length(value);

  result["numeric"] = substr(value, 1, (size - 1));
  result["direction"] = substr(value, size, 1);
  
}

BEGIN {  
  FPAT = "([^,]+)|(\"[^\"]+\")";   #This is the pattern to use for CSV fields
  
  sign["N"] = ""; 
  sign["S"] = "-";
  sign["E"] = "";
  sign["W"] = "-";
}

{
  #adjust the lat/lon fields from your worksheet here
   split($lat, lat_raw, " ");
   split($lon, lon_raw, " ");

   decompose(lat_raw[2], lat_dec); 
   decompose(lon_raw[2], lon_dec); 
 
   lat_decimal = lat_dec["numeric"] / 60;
   lon_decimal = lon_dec["numeric"] / 60;

   lat_sign = lat_dec["direction"];
   lon_sign = lon_dec["direction"];

   #adjust how many characters to grab according to your data
   print $0 "," sign[lat_sign] lat_raw[1] + lat_decimal  "," sign[lon_sign] lon_raw[1] + lon_decimal;
}
