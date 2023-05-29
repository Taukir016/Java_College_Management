package studentassignment;

import java.io.IOException;
import java.io.InputStream;
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

@WebServlet("/StudentAssignmentInsert")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) //10mb
public class StudentAssignmentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String jdbcURL = "jdbc:mysql://localhost:3306/project";
	private String jdbcUsername = "root";
	private String jdbcPassword = "Nomi@7238";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");

		InputStream resumeInputStream = null;
		Part resumePart = request.getPart("file");
		if (resumePart != null) {
			resumeInputStream = resumePart.getInputStream();
		}

		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			statement = connection
					.prepareStatement("INSERT INTO studentassignments(id, title, description, file) VALUES (?, ?, ?, ?)");

			statement.setString(1, id);
			statement.setString(2, name);
			statement.setString(3, subject);
			statement.setBlob(4, resumeInputStream);
			statement.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("studentmain.jsp");
			String message="Assignment Uploaded Succefully.....!";
			request.setAttribute("success",message);
			rd.include(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("studentmain.jsp");
			String message="Exception Found";
			request.setAttribute("success",message);
			rd.include(request, response);
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
					RequestDispatcher rd=request.getRequestDispatcher("studentmain.jsp");
					String message="Exception Found";
					request.setAttribute("success",message);
					rd.include(request, response);
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
					RequestDispatcher rd=request.getRequestDispatcher("studentmain.jsp");
					String message="Exception Found";
					request.setAttribute("success",message);
					rd.include(request, response);
				}
			}
		}
	}
}
