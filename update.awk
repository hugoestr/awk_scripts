BEGIN { FS = "," }
{
  print "UPDATE team SET  leader = " $2 " WHERE team_id = " $1 ";"
}
