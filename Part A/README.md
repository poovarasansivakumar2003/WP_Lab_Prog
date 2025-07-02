# Part A

## Overview
Develop and execute the following programs using HTML and PERL/PHP. Create database using MYSQL wherever necessary.

### XAMPP Installation Guide

XAMPP is a free and open-source cross-platform web server solution stack package that includes Apache HTTP Server, MySQL database, and interpreters for PHP and Perl.

#### Download and Installation Steps:

1. **Download XAMPP**
   - Visit: https://www.apachefriends.org/download.html
   - Choose the version for your operating system (Windows/macOS/Linux)
   - Download the latest stable version

2. **Windows Installation**
   - Run the downloaded installer as Administrator
   - Choose installation directory (default: `C:\xampp`)
   - Select components to install:
     - ✅ Apache
     - ✅ MySQL
     - ✅ PHP
     - ✅ Perl
     - ✅ phpMyAdmin
   - Complete the installation

3. **Start XAMPP Services**
   - Open XAMPP Control Panel
   - Start Apache server (for web server)
   - Start MySQL (for database)
   - Verify green status indicators

4. **Verify Installation**
   - Open browser and navigate to: `http://localhost`
   - You should see the XAMPP dashboard
   - Access phpMyAdmin: `http://localhost/phpmyadmin`

## Development Environment Setup

### 1. Document Root Configuration
- Place your files in: `C:\xampp\htdocs\`
- Access via: `http://localhost/`

### 2. Database Setup
- Access phpMyAdmin: `http://localhost/phpmyadmin`
- Create new database for your projects
- Import SQL scripts from `database/sql_scripts/` folder

### 3. File Permissions
- Ensure proper read/write permissions for web files
- PHP files should have .php extension
- Perl CGI scripts should have .pl or .cgi extension
- .pl file can be saved in C:\xampp\cgi-bin

## Technologies Used

### HTML5
- Semantic markup
- Forms and input validation
- Multimedia elements
- Responsive design principles

### PHP
- Server-side scripting
- Form processing
- Session management
- MySQL database connectivity
- File handling

### Perl
- CGI scripting
- Text processing
- Database connectivity

### MySQL
- Database design
- SQL queries
- Data manipulation
- Database connectivity with PHP/Perl

## Common Development Tasks

### 1. Creating HTML Forms
```html
<form action="process.php" method="POST">
    <input type="text" name="username" required>
    <input type="submit" value="Submit">
</form>
```

### 2. PHP Database Connection
```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "your_database";

$conn = new mysqli($servername, $username, $password, $dbname);
?>
```

### 3. Basic Perl CGI
```perl
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "<html><body>Hello World!</body></html>";
```

## Testing and Debugging

### Local Testing
- Use `http://localhost/` for testing web applications
- Check Apache and MySQL logs in XAMPP Control Panel
- Use browser developer tools for debugging

### Common Issues
1. **Port Conflicts**: Change Apache/MySQL ports if 80/3306 are occupied
2. **File Permissions**: Ensure files are readable by web server
3. **PHP Errors**: Enable error reporting in php.ini for development

## Resources

- [PHP Documentation](https://www.php.net/docs.php)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [HTML5 Reference](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [XAMPP Documentation](https://www.apachefriends.org/docs/)

## Troubleshooting

### XAMPP Not Starting
- Check if ports 80 and 3306 are free
- Run XAMPP as Administrator
- Check firewall settings

### Database Connection Issues
- Verify MySQL service is running
- Check database credentials
- Ensure database exists

### PHP Errors
- Check PHP error logs in XAMPP
- Verify file syntax
- Check file permissions

---

**Note**: Always backup your work and database before making significant changes.