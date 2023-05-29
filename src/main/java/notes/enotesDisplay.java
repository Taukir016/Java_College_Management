package notes;

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


@WebServlet("/enotesDisplay")
public class enotesDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");

            // Retrieve all data from the table
            String sql = "SELECT * FROM enotes";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Create a HTML table to display the data
            StringBuilder tableHtml = new StringBuilder();
            tableHtml.append("<center>");
            tableHtml.append("<h1 style='color:red;'>NOTES</h1>");
            tableHtml.append("<br>");
            
            tableHtml.append("<table border='3'  cell-padding='100'>");
            tableHtml.append("<tr><th style='padding-right: 300px;'>ID</th><th style='padding-right: 300px;'>Subject</th><th style='padding-right: 300px;'>Description</th><th>View NOTES</th></tr>");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String subject = resultSet.getString("subject");
                String description = resultSet.getString("description");

                tableHtml.append("<tr>");
                tableHtml.append("<td>").append(id).append("</td>");
                tableHtml.append("<td>").append(subject).append("</td>");
                tableHtml.append("<td>").append(description).append("</td>");
                tableHtml.append("<td><a href=\"enotesFileDisplay?id=").append(id).append("\">View Notes</a></td>");
                tableHtml.append("<td><a href=\"enotesDelete?id=").append(id).append("\">Delete</a></td>");
                tableHtml.append("</tr>");
            }
            tableHtml.append("</table>");
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
