package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FacultyLogin
 */
@WebServlet("/FacultyLoginServlet")
public class FacultyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	
	@Override
	public void init() throws ServletException{
	}
		
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from faculty");
			boolean isValidUser = false;
			while(rs.next()) {
			    if(email.equals(rs.getString(3)) && password.equals(rs.getString(6))) {
			        isValidUser = true;
			        break;
			    }
			}

			if(isValidUser) {
			    RequestDispatcher rd = request.getRequestDispatcher("facultymain.jsp");
			    rd.forward(request, response);
			}
			else {
			    RequestDispatcher rd = request.getRequestDispatcher("faclogin.jsp");
			    String success = "Enter correct details!..";
			    request.setAttribute("success", success);
			    rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("faclogin.jsp");
			String error="Enter correct details!..";
			request.setAttribute("success",error);
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
