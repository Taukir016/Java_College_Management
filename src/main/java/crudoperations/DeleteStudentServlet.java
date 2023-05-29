package crudoperations;

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


@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		String id=request.getParameter("usn");
		boolean account=false;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();


		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
			Statement stmt1=con1.createStatement();
			ResultSet rs=stmt1.executeQuery("select * from student;");

			while(rs.next()) {

				if(id.equalsIgnoreCase(rs.getString(2))) {
					account=true;

					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
					PreparedStatement stmt= con.prepareStatement("delete from student where usn=?");
					stmt.setString(1,id);
					stmt.execute();
					 RequestDispatcher rd=request.getRequestDispatcher("viewstudfac.jsp");
				        String message="Student Deleted Successfully";
				        request.setAttribute("success",message);
				        rd.include(request, response);
					break;
				}
				else {
					continue;
				}
			}

			if(!account){
				RequestDispatcher rd =request.getRequestDispatcher("viewstudfac.jsp");
				String message="ID not found";
		        request.setAttribute("success",message);
				rd.include(request, response);
				}
		}
		catch (Exception e) {
			System.out.println(e);
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
