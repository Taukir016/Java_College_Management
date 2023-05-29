package crudoperations;

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

/**
 * Servlet implementation class UpdateServletNew
 */
@WebServlet("/UpdateFacDetails")
public class UpdateFacDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateFacDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String mobile = request.getParameter("phone");
		String quali = request.getParameter("qualification");
		String pass = request.getParameter("password");
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Nomi@7238");

			PreparedStatement stmt = con.prepareStatement(
					"update faculty set name=?,id=?,email=?,phone=?,qualification=?,password=? where id =? ");
			
			stmt.setString(1, name);
			stmt.setString(2, id);
			stmt.setString(3, email);
			stmt.setString(4, mobile);
			stmt.setString(5, quali);
			stmt.setString(6, pass);
			stmt.setString(7, id);
			stmt.execute();
			con.close();
			stmt.close();
			RequestDispatcher r = request.getRequestDispatcher("viewfacfac.jsp");
			String message = "Successfully updated";
			request.setAttribute("success", message);
			r.include(request, response);
		} catch (Exception e) {
			System.out.println(e);
			RequestDispatcher r = request.getRequestDispatcher("viewfacfac.jsp");
			String message = "Error";
			request.setAttribute("success", message);
			r.include(request, response);
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
