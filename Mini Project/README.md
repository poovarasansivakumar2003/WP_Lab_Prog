# Online Resume Builder

A mini project demonstrating a web-based resume builder using **HTML**, **Java**, **CGI**, **Perl**, and **XML**. Users fill out a form, and the system generates a professional, ATS-friendly PDF resume.

---

## Features

- User-friendly web form for resume details.
- Data processed and stored in XML format.
- Java backend generates PDF resumes using Apache PDFBox.
- Perl CGI script handles form submission and workflow.
- Downloadable PDF resume.

---

## Technology Stack

- **Frontend:** HTML, CSS
- **Backend:** Perl (CGI), Java
- **Data Storage:** XML
- **PDF Generation:** [Apache PDFBox](https://pdfbox.apache.org/)
- **Web Server:** Apache (with CGI enabled) or XAMPP

---

## File Structure

```
xampp/
├── htdocs/
|   ├── resume_form.html           # HTML form
|   ├── output/
│        ├── resume.xml            # Generated XML data
│        └── resume.pdf            # Generated PDF resume
├── cgi-bin/
│   ├── generate_resume.pl         # Perl CGI script
|
├── java/
│   ├── ResumeFormatter.java  # Java PDF generator
│   └── pdfbox-app-3.0.5.jar  # PDFBox library (download separately)
├── 
```

---

## Prerequisites

- Java (JDK 8 or later)
- Apache web server (or XAMPP) with CGI enabled
- [Apache PDFBox JAR](https://pdfbox.apache.org/download.html) (e.g., `pdfbox-app-3.0.5.jar`)

---

## Setup Instructions

1. **Install Required Software**
   - Install Java.
   - Install XAMPP and enable CGI.

2. **Place Files**
   - `resume_form.html` → web root (`C:\xampp\htdocs`)
   - `generate_resume.pl` → `C:\xampp\cgi-bin`
   - `ResumeFormatter.java` and `pdfbox-app-3.0.5.jar` → `C:\xampp\java`
   - create `C:\xampp\htdocs\output` and is writable.

3. **Compile Java Program**
   ```sh
   cd java
   javac -cp ".;pdfbox-app-3.0.5.jar" ResumeFormatter.java
   ```

4. **Make Perl Script Executable (Linux/Mac)**
   ```sh
   chmod +x cgi-bin/generate_resume.pl
   ```

---

## Usage

1. Start your web server (Apache/XAMPP).
2. Open a browser and go to `http://localhost/resume_form.html`.
3. Fill out the form and submit.
4. Download your generated PDF resume from the provided link.

---

## Troubleshooting

- Ensure Java and Perl are installed and in your system PATH.
- Check web server logs for errors if the process fails.
- Make sure the `output/` directory exists and is writable.
- Adjust file paths in scripts if your directory structure differs.
- If using a different PDFBox version, update the JAR filename in commands and scripts.

---

## Notes

- PDFBox is pure Java and does not require native libraries.
- No changes are needed to Perl or HTML files for PDF output.
- The Java program generates a professional, ATS-friendly PDF resume using only open source libraries.

---