package studentassignment;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/StudentAssignmentDisplay")
public class StudentAssignmentDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");

            // Retrieve all data from the table
            String sql = "SELECT * FROM facassignments";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Create a HTML table to display the data
            StringBuilder tableHtml = new StringBuilder();
            tableHtml.append("<center>");
            tableHtml.append("<h2 style='color:red;'>ASSIGNED ASSIGNMENTS</h2>");
            tableHtml.append("<br>");
            
            tableHtml.append("<style>");
            tableHtml.append("table { border-collapse: collapse; }");
            tableHtml.append("th, td { border: 1px solid black; }");
            tableHtml.append("</style>");
            
            tableHtml.append("<table border='2'  cell-padding='30'>");
            tableHtml.append("<tr><th>ID</th><th>Subject</th><th>Description</th><th>View File</th></tr>");
            //tableHtml.append("<tr><th style='padding-right: 20px;'>ID</th><th style='padding-right: 20px;'>Subject</th><th style='padding-right: 50px;'>Description</th><th>File</th></tr>");
                     
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String subject = resultSet.getString("subject");
                String description = resultSet.getString("description");

                tableHtml.append("<tr>");
                tableHtml.append("<td style='width: 200px;'>").append(id).append("</td>");
                tableHtml.append("<td style='width: 150px;'>").append(subject).append("</td>");
                tableHtml.append("<td style='width: 200px;'>").append(description).append("</td>");
                tableHtml.append("<td style='width: 100px;'><a href=\"FileDisplayServlet?id=").append(id).append("\">View File</a></td>");
                tableHtml.append("</tr>");
            }
            tableHtml.append("</table>");
            tableHtml.append("<br>");
            tableHtml.append("<button style=\"background-color: DarkBlue; color: white; padding: 7px 30px; font-size: 15px;\" onclick=\"window.location.href='studentindex.jsp'\">Back</button>");
            tableHtml.append("<center>");

            // Close the database connection
            resultSet.close();
            statement.close();
            conn.close();

            // Write the HTML response to the client
            response.setContentType("text/html");
            OutputStream out = response.getOutputStream();
            out.write(tableHtml.toString().getBytes());
            out.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}