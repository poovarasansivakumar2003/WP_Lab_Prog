# Program 15

## Objective
Program to accept username and address and display the webpage by passing parameters.

## Setup

1. **Configure Tomcat in Eclipse**
    - Make sure Tomcat is started before setup in Eclipse.
    - Window > Preferences > Server > Runtime Environments > Add > Apache > Tomcat v9.0 > Next
    - Browse to Tomcat folder (e.g., `C:\Tomcat9`)
    - Click Finish, then Apply and Close

2. **Create a Dynamic Web Project**
    - File > New > Dynamic Web Project
    - Enter Project Name (e.g., `Program15`)
    - Select Target Runtime as Apache Tomcat v9.0
    - Keep default configuration and click Finish

3. **Add Static Web Content**
    - Navigate to `src/main/webapp` (create this folder structure if not already present)
    - Right-click on `webapp` > New > File > Name it `userForm.html`
    - Use the following code:

    ```html
    <!-- userForm.html -->
    <!DOCTYPE html>
    <html>
    <head>
        <title>User Input Form</title>
    </head>
    <body>
        <h2>Enter Your Details</h2>
        <form action="userServlet" method="get">
            <label for="username">Username:</label>
            <input type="text" name="username" required><br><br>

            <label for="address">Address:</label>
            <input type="text" name="address" required><br><br>

            <input type="submit" value="Submit">
        </form>
    </body>
    </html>
    ```

4. **Create the Servlet**
    - Right-click on Java Resources > src → New > Servlet
    - Package name: `userPackage`
    - Class name: `UserClass`
    - Click Finish
    - Replace the generated code with:

    ```java
    // filepath: src/userPackage/UserClass.java
    package userPackage;
    import java.io.*;
    import javax.servlet.*;
    import javax.servlet.http.*;
    import javax.servlet.annotation.WebServlet;

    @WebServlet("/userServlet")
    public class UserClass extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Get parameters from request
            String username = request.getParameter("username");
            String address = request.getParameter("address");

            // Display them in the response
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>User Details</title></head><body>");
            out.println("<h2>User Details Received</h2>");
            out.println("<p><strong>Username:</strong> " + escapeHtml(username) + "</p>");
            out.println("<p><strong>Address:</strong> " + escapeHtml(address) + "</p>");
            out.println("</body></html>");
        }

        // Prevent XSS
        private String escapeHtml(String input) {
            if (input == null) return "";
            return input.replaceAll("&", "&amp;")
                        .replaceAll("<", "&lt;")
                        .replaceAll(">", "&gt;");
        }
    }
    ```

---

## How to Run

1. Right-click the project > Run As > Run on Server
2. Choose Tomcat v9.0
3. Open a browser and go to:  
   `http://localhost:8080/Program15/userForm.html`
4. Enter a username and address and submit to see the result.

---