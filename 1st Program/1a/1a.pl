#!C:/xampp/perl/bin/perl.exe
print "Content-type: text/html\n\n";

print <<'Here';
<html> 
<head><title>Environment Variables</title></head> 
<body> 
<center> 
<table border=1> 
<tr> 
<th>ENV_VARIABLES</th><th>Value</th> 
</tr>
Here

# Display values in a table 
foreach my $i (sort keys %ENV) { 
    print "<tr><td>$i</td><td>$ENV{$i}</td></tr>\n"; 
}

print <<'Here';
</table> 
</center> 
</body> 
</html> 
Here
