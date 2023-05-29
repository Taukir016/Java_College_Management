package assignments;

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


@WebServlet("/AssignmentInsert")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB
public class AssignmentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String jdbcURL = "jdbc:mysql://localhost:3306/project";
	private String jdbcUsername = "root";
	private String jdbcPassword = "Nomi@7238";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
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
					.prepareStatement("INSERT INTO facassignments(id, title, description, file) VALUES (?, ?, ?, ?)");

			statement.setInt(1, id);
			statement.setString(2, title);
			statement.setString(3, description);
			statement.setBlob(4, resumeInputStream);
			statement.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("facultymain.jsp");
			String message="Assignment Added Successfully";
			request.setAttribute("success",message);
			rd.include(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
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