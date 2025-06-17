#!C:/xampp/perl/bin/perl.exe

# Load CGI standard routines
use strict;
use warnings;
use CGI ':standard';

# Get input from query string
my $cmd = param('name') || 'Guest';  # Default to 'Guest' if no input

# Define an array of greeting messages
my @greet = ("Hello", "Hi", "Nice meeting you", "Have a nice day");

# Choose a random greeting
my $index = int(rand(@greet));

# Print HTTP header and HTML content
print header();
print <<HTML;
<html>
<head><title>Greeting</title></head>
<body>
<center>
<h2>$cmd, $greet[$index]!</h2>
</center>
</body>
</html>
HTML
