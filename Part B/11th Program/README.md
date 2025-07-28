# Program 11

## Objective
Program to display a greeting based on the access time of the server.

## Setup

1. **Configure Tomcat in Eclipse**
    - Make sure Tomcat is started before setup in Eclipse.
    - Window > Preferences > Server > Runtime Environments > Add > Apache > Tomcat v9.0 > Next
    - Browse to Tomcat folder (e.g., `C:\Tomcat9`)
    - Click Finish, then Apply and Close

2. **Create a Dynamic Web Project**
    - File > New > Dynamic Web Project
    - Enter Project Name (e.g., `Program11`)
    - Select Target Runtime as Apache Tomcat v9.0
    - Keep default configuration and click Finish

3. **Add Static Web Content**
    - Navigate to `src/main/webapp` (create this folder structure if not already present)
    - Right-click on `webapp` > New > File > Name it `greet.html`
    - Use the following code:

    ```html
    <!-- greet.html -->
    <!DOCTYPE html>
    <html>
    <head>
        <title>Greeting Page</title>
    </head>
    <body>
        <h2>Click below to get the greeting based on server time:</h2>
        <form action="greetServlet" method="get">
            <input type="submit" value="Get Greeting">
        </form>
    </body>
    </html>
    ```

4. **Create the Servlet**
    - Right-click on Java Resources > src → New > Servlet
    - Package name: `greetPackage`
    - Class name: `GreetClass`
    - Click Finish
    - Replace the generated code with:

    ```java
    // filepath: src/greetPackage/GreetClass.java
    package greetPackage;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.time.LocalTime;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.*;

    @WebServlet("/greetServlet")
    public class GreetClass extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            LocalTime time = LocalTime.now();
            int hour = time.getHour();

            String greeting;
            if (hour >= 5 && hour < 12) {
                greeting = "Good Morning!";
            } else if (hour >= 12 && hour < 17) {
                greeting = "Good Afternoon!";
            } else if (hour >= 17 && hour < 21) {
                greeting = "Good Evening!";
            } else {
                greeting = "Good Night!";
            }

            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Greeting</title></head><body>");
            out.println("<h1>" + greeting + "</h1>");
            out.println("<p>Current server time: " + time + "</p>");
            out.println("</body></html>");
        }
    }
    ```

---

## How to Run

1. Right-click the project > Run As > Run on Server
2. Choose Tomcat v9.0
3. Open a browser and go to:  
   `http://localhost:8080/Program11/greet.html`

---