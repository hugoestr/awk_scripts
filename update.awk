BEGIN { FS = "," }
{
   print "UPDATE incidents SET  lat = " $8 ", lon = " $9  " WHERE id = " $1 ";";
}
