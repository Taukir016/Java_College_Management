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
 * Servlet implementation class UpdateStudDetServlet
 */
@WebServlet("/UpdateStudDetServlet")
public class UpdateStudDetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudDetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		String usn = request.getParameter("usn");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String pass = request.getParameter("password");

		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Nomi@7238");

			PreparedStatement stmt = con.prepareStatement(
					"update student set name=?,usn=?,email=?,phone=?,password=? where usn =? ");
			stmt.setString(1, name);
			stmt.setString(2, usn);
			stmt.setString(3, email);
			stmt.setString(4, phone);
			stmt.setString(5, pass);
			stmt.setString(6, usn);
			stmt.execute();
			con.close();
			stmt.close();
			RequestDispatcher r = request.getRequestDispatcher("viewstudfac.jsp");
			String message = "Successfully updated";
			request.setAttribute("success", message);
			r.include(request, response);
		} catch (Exception e) {
			System.out.println(e);
			RequestDispatcher r = request.getRequestDispatcher("viewstudfac.jsp");
			String message = "Error";
			request.setAttribute("success", message);
			r.include(request, response);
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
