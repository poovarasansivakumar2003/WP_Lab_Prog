#!C:/xampp/perl/bin/perl.exe

use strict;
use warnings;
use CGI ':standard';

# Output HTTP header
print header();

# File path (use full path or ensure script has access)
my $file = 'count.txt';

# Initialize count
my $count = 0;

# Read current count
if (open(my $in, '<', $file)) {
    chomp($count = <$in>);
    close($in);
}

# Increment count
$count++;

# Write new count back to file
if (open(my $out, '>', $file)) {
    print $out "$count";
    close($out);
} else {
    die "Cannot write to $file: $!";
}

# Output HTML
print <<HTML;
<html>
<head><title>Visitor Count</title></head>
<body>
<center>
<h2>This page has been viewed $count times</h2>
</center>
</body>
</html>
HTML
