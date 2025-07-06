#!C:/xampp/perl/bin/perl.exe

use strict;
use warnings;
use CGI;

my $q = CGI->new;

# Collect form data
my $name = $q->param('name') // '';
my $email = $q->param('email') // '';
my $phone = $q->param('phone') // '';
my $address = $q->param('address') // '';
my $summary = $q->param('summary') // '';
my $skills = $q->param('skills') // '';
my $education = $q->param('education') // '';
my $experience = $q->param('experience') // '';
my $projects = $q->param('projects') // '';
my $certifications = $q->param('certifications') // '';
my $hobbies = $q->param('hobbies') // '';

# Escape XML special characters
sub xml_escape {
    my $s = shift // '';
    $s =~ s/&/&amp;/g;
    $s =~ s/</&lt;/g;
    $s =~ s/>/&gt;/g;
    $s =~ s/"/&quot;/g;
    $s =~ s/'/&apos;/g;
    return $s;
}

# Save as XML (always)
open(my $fh, '>', '../htdocs/output/resume.xml') or do {
    print $q->header(), "<html><body><h2>Error: Cannot open XML file for writing!</h2></body></html>";
    exit;
};
print $fh <<EOF;
<resume>
    <name>@{[xml_escape($name)]}</name>
    <email>@{[xml_escape($email)]}</email>
    <phone>@{[xml_escape($phone)]}</phone>
    <address>@{[xml_escape($address)]}</address>
    <summary>@{[xml_escape($summary)]}</summary>
    <skills>@{[xml_escape($skills)]}</skills>
    <education>@{[xml_escape($education)]}</education>
    <experience>@{[xml_escape($experience)]}</experience>
    <projects>@{[xml_escape($projects)]}</projects>
    <certifications>@{[xml_escape($certifications)]}</certifications>
    <hobbies>@{[xml_escape($hobbies)]}</hobbies>
</resume>
EOF
close $fh;

# Immediately generate PDF resume using Java after saving XML
my $java_output = `cd ../java && java -cp ".;pdfbox-app-3.0.5.jar" ResumeFormatter 2>&1`;

# Check if PDF was generated
my $pdf_path = '../htdocs/output/resume.pdf';
if (-e $pdf_path) {
    print $q->header();
    print <<'HTML';
<html>
<head>
<style>
    body {
        background: #f4f6f8;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .result-container {
        background: #fff;
        max-width: 420px;
        margin: 60px auto 0 auto;
        padding: 32px 28px 24px 28px;
        border-radius: 10px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.10);
        text-align: center;
    }
    h2 {
        color: #1976d2;
        margin-bottom: 18px;
    }
    .download-link {
        display: inline-block;
        margin: 18px 0 0 0;
        padding: 12px 28px;
        background: #1976d2;
        color: #fff;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        text-decoration: none;
        transition: background 0.2s;
    }
    .download-link:hover {
        background: #125ea7;
    }
</style>
</head>
<body>
    <div class="result-container">
        <h2>Your professional resume is ready!</h2>
        <a class="download-link" href="/output/resume.pdf" download>Download Resume (PDF)</a>
    </div>
</body>
</html>
HTML
} else {
    print $q->header();
    print <<HTML;
<html>
<head>
<style>
    body {
        background: #f4f6f8;
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .result-container {
        background: #fff;
        max-width: 420px;
        margin: 60px auto 0 auto;
        padding: 32px 28px 24px 28px;
        border-radius: 10px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.10);
        text-align: center;
    }
    h2 {
        color: #d32f2f;
        margin-bottom: 18px;
    }
    pre {
        background: #f9f2f4;
        color: #b71c1c;
        padding: 10px;
        border-radius: 5px;
        font-size: 13px;
        overflow-x: auto;
        text-align: left;
    }
</style>
</head>
<body>
    <div class="result-container">
        <h2>Error: Resume PDF could not be generated.</h2>
        <pre>$java_output</pre>
    </div>
</body>
</html>
HTML
}