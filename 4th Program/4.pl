#!C:/xampp/perl/bin/perl.exe 
use CGI ':standard'; 
# Set refresh header and content type 
print "Refresh: 1\n"; 
print "Content-type: text/html\n\n"; 
# Get current local time (hours, minutes, seconds) 
($s, $m, $h) = localtime(time); 
# Display the time 
print "<html><body><center>"; 
print br() . "The current server time is $h:$m:$s"; 
print br() . "In words, the time is - $h hours, $m minutes and $s seconds"; 
print "</center></body></html>";