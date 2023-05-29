package notes;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@WebServlet("/enotesInsert")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB
public class enotesInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String jdbcURL = "jdbc:mysql://localhost:3306/project";
	private String jdbcUsername = "root";
	private String jdbcPassword = "Nomi@7238";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");

		InputStream resumeInputStream = null;
		Part resumePart = request.getPart("file");
		if (resumePart != null) {
			resumeInputStream = resumePart.getInputStream();
		}

		Connection connection = null;
		PreparedStatement statement = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			statement = connection
					.prepareStatement("INSERT INTO enotes (id, subject, description, file) VALUES (?, ?, ?, ?)");

			statement.setInt(1, id);
			statement.setString(2, subject);
			statement.setString(3, description);
			statement.setBlob(4, resumeInputStream);

			statement.executeUpdate();
			RequestDispatcher rd =request.getRequestDispatcher("facultymain.jsp");
			String message="Succesfully added Notes";
			request.setAttribute("success",message);
			rd.include(request, response);
//response.sendRedirect("success.jsp"); // Redirect to success page 
//response.sendRedirect("ApplicantsServlet"); // Redirect to success page ApplicantsServlet
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
//response.sendRedirect("error.jsp"); // Redirect to error page
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
