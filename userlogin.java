

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userlogin
 */
@WebServlet("/userlogin")
public class userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
       
        try {
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
String qr="select * from userrg where email=? and password=? ";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);
ps.setString(2, password);
ResultSet rs=ps.executeQuery();

if(rs.next())

{

    HttpSession session=request.getSession();
    session.setAttribute("uid",email);
    response.sendRedirect("userhome.html");

}
 else
{
 out.println("invalid id and password");
 }
        } catch (Exception e) {
            out.println(e);
        }

	}

}
