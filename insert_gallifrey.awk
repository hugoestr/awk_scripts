BEGIN {  FPAT = "([^,]+)|(\"[^\"]+\")"; }
{
  gsub("\"", "", $1);
  gsub("'", "''", $1);
  gsub(/_+/, "____", $1);

  if (!$2){
    print "INSERT INTO black_cards VALUES (DEFAULT, '" $1 "', 0, 1, 'DW');";
  } else {
    print "INSERT INTO white_cards VALUES (DEFAULT, '" $1 "' ,'DW');";
  }
}
