# usage: gawk -v x=lat_column -v y=lon_column -f to_decimal.awk  <csv file name>
BEGIN {  FPAT = "([^,]+)|(\"[^\"]+\")"; }  #This is the pattern to use for CSV fields
{
  #adjust the lat/lon fields from your worksheet here
   split($x, lat, " ");
   split($y, lon, " ");
   
   lat_decimal = lat[2] / 60;
   lon_decimal = lon[2] / 60;

   #adjust how many characters to grab according to your data
   print $0 "," lat[1] + lat_decimal  ", " lon[1] + lon_decimal;
  
   # modify this line if the data contains the degree character
   #print $0 ",-" substr(lat[1],1,2) + lat_decimal  ", " substr(lon[1],1,3) + lon_decimal;

}
