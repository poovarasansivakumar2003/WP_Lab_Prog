# Part B

## Overview
Develop and execute the following programs using HTML and JAVA Servlets.

## Step-by-Step Setup Instructions

### 1. Install Java Development Kit (JDK)
- Download the latest JDK from [Oracle JDK Downloads](https://www.oracle.com/java/technologies/downloads/).
- Run the installer and follow the prompts to complete installation.
- Set the `JAVA_HOME` environment variable:
  - Right-click on 'This PC' > Properties > Advanced system settings > Environment Variables.
  - Under System Variables, click 'New', enter `JAVA_HOME` as the variable name and the JDK installation path as the value (e.g., `C:\Program Files\Java\jdk-XX.X.X`).
  - Add `%JAVA_HOME%\bin` to the `Path` variable.

- Verify installation:
  - Open Command Prompt and run:
    ```
    java -version
    javac -version
    ```

### 2. Install Apache Tomcat
- Download Tomcat from [Tomcat Downloads](https://tomcat.apache.org/download-90.cgi) (choose the latest 9.x.xx).
- Extract the downloaded zip file to a preferred location (e.g., `C:\apache-tomcat-9.x.xx`).
- Set the `CATALINA_HOME` environment variable (optional but recommended):
  - Add a new system variable `CATALINA_HOME` with the Tomcat folder path.
- To start Tomcat:
  - Navigate to the `bin` directory inside Tomcat and run `startup.bat`.
  - Access Tomcat in your browser at [http://localhost:8080](http://localhost:8080).

### 3. Install Eclipse IDE for Java EE Developers
- Download Eclipse IDE from [Eclipse Downloads](https://www.eclipse.org/downloads/packages/release/2025-06/r/eclipse-ide-enterprise-java-and-web-developers).
- Complete the installation and launch Eclipse.

### 4. Configure Eclipse for Servlet Development
- Open Eclipse and select a workspace directory.
- Go to `File > New > Dynamic Web Project`.
- Enter a project name and select the appropriate runtime (Apache Tomcat).
  - If Tomcat is not listed, click `New Runtime`, select Apache Tomcat, and browse to your Tomcat installation directory.
- Click `Finish` to create the project.

### 5. Create and Deploy Servlets
- Right-click on the `src` folder > `New > Servlet`.
- Enter the package and class name, then click `Finish`.
- Write your servlet code.
- To run the project:
  - Right-click the project > `Run As > Run on Server`.
  - Choose the configured Tomcat server and click `Finish`.
  - The servlet will be accessible at `http://localhost:8080/YourProjectName/YourServletName`.

---

**You are now ready to develop and execute HTML and Java Servlet programs using Eclipse and Tomcat.**