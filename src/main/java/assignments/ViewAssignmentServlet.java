package assignments;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

/**
 * Servlet implementation class ViewAssignmentServlet
 */
@WebServlet("/ViewAssignmentServlet")
public class ViewAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String DB_URL = "jdbc:mysql://localhost:3306/project";
	private static final String DB_USER = "root";
	private static final String DB_PASS = "Nomi@7238";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAssignmentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String title = request.getParameter("title");
        String description = request.getParameter("description");
        Part filePart = request.getPart("file");
        
        // Get database connection
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capstone", "root", "Nomi@7238");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Insert data into database
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO files VALUES (?, ?, ?)");
            pstmt.setString(1, title);
            pstmt.setString(2, description);
            pstmt.setString(3, filePart.getSubmittedFileName());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Save file to disk
        String savePath = "C:\\uploads\\" + filePart.getSubmittedFileName(); // Change this to your desired file path
        File file = new File(savePath);
        try (InputStream is = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead = 0;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
        
        // Close database connection and redirect to success page
        try {
            conn.close();
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
}
}
