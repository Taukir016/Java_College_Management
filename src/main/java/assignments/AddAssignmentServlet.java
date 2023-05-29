package assignments;

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
 * Servlet implementation class AddAssignmentServlet
 */
//Annotation
@WebServlet("/AddAssignmentServlet")
public class AddAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con;
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@Override
	public void init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    public AddAssignmentServlet() {
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
		String desc = request.getParameter("description");
		String file = request.getParameter("file");
		
		String sql = "insert into studassignments values(?,?,?)";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, title);
			pst.setString(2, desc);
			pst.setString(3, file);
			pst.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("studentmain.jsp");
			String success="Successfully Registered";
			request.setAttribute("success",success);
			rd.include(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("studentmain.jsp");
			String success="Enter correct details!..";
			request.setAttribute("success",success);
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
