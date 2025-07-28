# Program 14

## Objective
Program to request server information viz. Request Method, URI, Protocol, and Remote address.

## Setup

1. **Configure Tomcat in Eclipse**
    - Make sure Tomcat is started before setup in Eclipse.
    - Window > Preferences > Server > Runtime Environments > Add > Apache > Tomcat v9.0 > Next
    - Browse to Tomcat folder (e.g., `C:\Tomcat9`)
    - Click Finish, then Apply and Close

2. **Create a Dynamic Web Project**
    - File > New > Dynamic Web Project
    - Enter Project Name (e.g., `Program14`)
    - Select Target Runtime as Apache Tomcat v9.0
    - Keep default configuration and click Finish

3. **Add Static Web Content**
    - Navigate to `src/main/webapp` (create this folder structure if not already present)
    - Right-click on `webapp` > New > File > Name it `server.html`
    - Use the following code:

    ```html
    <!-- server.html -->
    <!DOCTYPE html>
    <html>
    <head>
        <title>Server Request Info</title>
    </head>
    <body>
        <h2>Click below to view server request details:</h2>
        <form action="serverServlet" method="get">
            <input type="submit" value="Show Server Info">
        </form>
    </body>
    </html>
    ```

4. **Create the Servlet**
    - Right-click on Java Resources > src → New > Servlet
    - Package name: `serverPackage`
    - Class name: `ServerClass`
    - Click Finish
    - Replace the generated code with:

    ```java
    // filepath: src/serverPackage/ServerClass.java
    package serverPackage;
    import java.io.*;
    import javax.servlet.*;
    import javax.servlet.http.*;
    import javax.servlet.annotation.WebServlet;

    @WebServlet("/serverServlet")
    public class ServerClass extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Gather server-side request information
            String method = request.getMethod();
            String uri = request.getRequestURI();
            String protocol = request.getProtocol();
            String remoteAddr = request.getRemoteAddr();

            // Display info in HTML
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Server Request Info</title></head><body>");
            out.println("<h2>Server Request Information</h2>");
            out.println("<p><strong>Request Method:</strong> " + method + "</p>");
            out.println("<p><strong>Request URI:</strong> " + uri + "</p>");
            out.println("<p><strong>Protocol:</strong> " + protocol + "</p>");
            out.println("<p><strong>Remote Address:</strong> " + remoteAddr + "</p>");
            out.println("</body></html>");
        }
    }
    ```

---

## How to Run

1. Right-click the project > Run As > Run on Server
2. Choose Tomcat v9.0
3. Open a browser and go to:  
   `http://localhost:8080/Program14/server.html`

---
