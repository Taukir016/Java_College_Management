package crudoperations;

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
 * Servlet implementation class FacultyAddServlet
 */
@WebServlet("/FacultyAddServlet")
public class FacultyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	public void init()  {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Nomi@7238");
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String facname =  request.getParameter("name");
		String facid = request.getParameter("facid");
		String facmail = request.getParameter("email");
		String facphone = request.getParameter("phone");
		String quali = request.getParameter("qualification");
		String facpass = request.getParameter("password");
		
		
		String sql = "insert into faculty values(?,?,?,?,?,?)";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, facname);
			pst.setString(2,facid);
			pst.setString(3, facmail);
			pst.setString(4,facphone);
			pst.setString(5, quali);
			pst.setString(6,facpass);
			pst.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("viewfacfac.jsp");
			String message="Successfully Registered";
			request.setAttribute("success",message);
			rd.include(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("viewfacfac.jsp");
			String message="Enter correct details!..";
			request.setAttribute("error",message);
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
