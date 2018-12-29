

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class landlordrg
 */
@WebServlet("/landlordrg")
public class landlordrg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public landlordrg() {
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
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String address=request.getParameter("address");
            String contact=request.getParameter("contact");
            String gender=request.getParameter("gender");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr= "insert into landlord values(?,?,?,?,?,?,?)";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(1,firstname);
            ps.setString(2,lastname);
            ps.setString(3,email);
            ps.setString(4,password);
            ps.setString(5,address);
            ps.setString(6, contact);
            ps.setString(7, gender);
            ps.executeUpdate();
            response.sendRedirect("ld login.html");
        } catch(Exception e) {
            out.println(e);
        }
	}

}
