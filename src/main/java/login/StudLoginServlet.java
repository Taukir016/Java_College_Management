
package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class StudLogin
 */
@WebServlet("/StudLoginServlet")
public class StudLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from student");
			boolean isValidUser = false;
			while(rs.next()) {
			    if(email.equalsIgnoreCase(rs.getString(3)) && password.equalsIgnoreCase(rs.getString(5))) {
			        isValidUser = true;
			        break;
			    }
			}

			if(isValidUser) {
			    RequestDispatcher rd = request.getRequestDispatcher("studentmain.jsp");
			    rd.forward(request, response);
			}
			else {
			    RequestDispatcher rd = request.getRequestDispatcher("studlogin.jsp");
			    String success = "Enter correct details!..";
			    request.setAttribute("success", success);
			    rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd=request.getRequestDispatcher("studlogin.jsp");
			String success="Enter correct details!..";
			request.setAttribute("error",success);
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
