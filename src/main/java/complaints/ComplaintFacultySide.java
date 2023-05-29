package complaints;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComplaintFacultySide
 */
@WebServlet("/ComplaintFacultySide")
public class ComplaintFacultySide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintFacultySide() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String complaintOn = request.getParameter("complaintOn");
		String complaintDetails = request.getParameter("complaintDetails");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root",
					"Nomi@7238");
			String sql = "INSERT INTO complaints VALUES (?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, id);
			statement.setString(2, name);
			statement.setString(3, complaintOn);	
			statement.setString(4, complaintDetails);
			
			statement.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("viewcomplaintsfac.jsp");
			String success = "Complaints Saved Successfully";
			request.setAttribute("success", success);
			rd.include(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("complaints.jsp");
			String success = "Please check errors";
			request.setAttribute("success", success);
			rd.include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
