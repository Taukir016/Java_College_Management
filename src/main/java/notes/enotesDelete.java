package notes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class enotesDelete
 */
@WebServlet("/enotesDelete")
public class enotesDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));

	        Connection conn = null;
	        PreparedStatement statement = null;
	        try {
	            // Connect to the database
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","Nomi@7238");

	            String sql = "DELETE FROM enotes WHERE id=?";
	            statement = conn.prepareStatement(sql);
	            statement.setInt(1, id);
	            statement.executeUpdate();

	            // Redirect back to the AssignmentDisplay servlet
	            response.sendRedirect(request.getContextPath() + "/enotesDisplay");
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        } finally {
	            // Close the database connection and resources
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
