package passwords;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FacultyChangePassword")
public class FacultyChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FacultyChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		String pass=request.getParameter("newpassword");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
			PreparedStatement stmt= con.prepareStatement("update faculty set password=? where facid=?;");
		
			stmt.setString(1,pass);
			stmt.setInt(2,id);
			stmt.executeUpdate();
			con.close();
			stmt.close();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
	    RequestDispatcher rd=request.getRequestDispatcher("facultychangepassword.jsp");
        String success="Password Updated Successfully";
        request.setAttribute("success",success);
        rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		}

}