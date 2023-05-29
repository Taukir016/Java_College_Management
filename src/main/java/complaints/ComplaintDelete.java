package complaints;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ComplaintDelete")
public class ComplaintDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public ComplaintDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("compid");
		boolean account=false;
		response.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
			Statement stmt1=con1.createStatement();
			ResultSet rs=stmt1.executeQuery("select * from complaints");

			while(rs.next()) {

				if(id.equalsIgnoreCase(rs.getString("id"))) {
					account=true;

					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
					PreparedStatement stmt= con.prepareStatement("delete from complaints where id=?");
					stmt.setString(1,id);
					stmt.execute();
					RequestDispatcher rd =request.getRequestDispatcher("viewcomplaintsfac.jsp");
					String message="Complaint deleted Sucesfully";
					request.setAttribute("success",message);
					rd.include(request,response);
					break;
				}
				else {
					continue;
				}
			}

			if(!account){ 
				RequestDispatcher rd =request.getRequestDispatcher("viewcomplaintsfac.jsp");
				String message="Complaint on This Name doesn't Exist";
				request.setAttribute("success",message);
				rd.include(request, response);
				}
		}
		catch (Exception e) {
			System.out.println(e);
			RequestDispatcher rd =request.getRequestDispatcher("viewcomplaintsfac.jsp");
			String message="Exception Found";
			request.setAttribute("success",message);
			rd.include(request, response);
		}
	}

}
