

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
 * Servlet implementation class userhome
 */
@WebServlet("/userhome")
public class userhome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userhome() {
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
            String r =request.getParameter("rooms");
            int rooms=Integer.parseInt(r);
            String sharing =request.getParameter("sharing");
            String p=request.getParameter("price");
            int price=Integer.parseInt(p);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr= "select * from property where area=?,locality=?";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(1,area);
            ps.setString(2,locality);
            ps.setString(3,category);
            ps.setString(4,propertytype);
            ps.setInt(5,rooms);
            ps.setString(6,sharing);
            ps.setInt(7,price);
            ResultSet rs=ps.executeQuery();
            response.sendRedirect("usrehome.html");

            
            HttpSession session=request.getSession();
            String email=(String)session.getAttribute("uid");
            out.println(email);
        } 
        catch (Exception e) {
            out.println(e);
        }

	}

}
