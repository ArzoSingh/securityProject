

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
 * Servlet implementation class ldhome
 */
@WebServlet("/ldhome")
public class ldhome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ldhome() {
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
            String area =request.getParameter("area");
            String locality =request.getParameter("locality");
            String category =request.getParameter("category");
            String propertytype =request.getParameter("propertytype");
            String b =request.getParameter("beds");
            int beds= Integer.parseInt(b);
            String r =request.getParameter("rooms");
            int rooms=Integer.parseInt(r);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr= "insert into property values(?,?,?,?,?,?)";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(1,area);
            ps.setString(2,locality);
            ps.setString(3,category);
            ps.setString(4,propertytype);
            ps.setInt(5,beds);
            ps.setInt(6,rooms);

            ps.executeUpdate();
            response.sendRedirect("ldhome.html");


           
        } catch(Exception e) {
            out.println(e);
        }

	}

}
