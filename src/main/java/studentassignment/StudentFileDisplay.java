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


@WebServlet("/StudentFileDisplay")
public class StudentFileDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileId = request.getParameter("id");

        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");

            // Retrieve the file from the database
            String sql = "SELECT file FROM studentassignments WHERE id=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, fileId);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Get the file data from the result set
                byte[] fileData = resultSet.getBytes("file");

                // Set the content type based on the file type
                //response.setContentType(getServletContext().getMimeType("filename.pdf"));

                // Set the content length
                response.setContentLength(fileData.length);

                // Write the file data to the response output stream
                OutputStream out = response.getOutputStream();
                out.write(fileData);
                out.close();
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            // Close the database connection and resources
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
