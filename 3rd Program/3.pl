#!C:/xampp/perl/bin/perl.exe 
use strict; 
use warnings; 
use CGI ':standard'; 
use POSIX 'strftime'; 
# Print HTTP header 
print header; 
# Get the current server time in hours 
my $hour = strftime("%H", localtime); 
# Determine greeting based on time 
my $greeting; 
if ($hour < 12) { 
$greeting = "Good Morning!"; 
} elsif ($hour < 18) { 
$greeting = "Good Afternoon!"; 
} else { 
$greeting = "Good Evening!"; 
} 
# Check if the webmaster (admin) is logged in 
# This is a basic simulation. Adjust it according to your actual login verification method. 
# In a real scenario, you might check session or authentication data. 
my $is_webmaster_logged_in = 1; # Set to 1 to simulate the webmaster being logged in, or 0 otherwise. 
my $login_status = $is_webmaster_logged_in ? "The webmaster is currently logged in." : "The 
webmaster is not logged in."; 
# Output HTML content 
print start_html("Greeting and Login Check"), 
h1("Greeting Based on Access Time"), 
p($greeting), 
h2("Webmaster Login Status"), 
p($login_status), 
end_html; 