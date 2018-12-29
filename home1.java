

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class home1
 */
@WebServlet("/home1")
public class home1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home1() {
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
	             

	           
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>Servlet home</title>");
	            out.println("</head>");
	            out.println("<body>");
	            out.println("<h1 align=center>WELCOME</h1>");
	            HttpSession session=request.getSession();
	            String email=(String)session.getAttribute("ldid");
	            out.println(email);
	            out.println("<a href=ldlogout align=right>LOGOUT</a> ");
	            out.println("<br><a href=ldadd.html> ADD DETAILS </a>");
	            out.println ("<a href=ldshow> SHOW DETAILS </a>");
	            out.println("</body>");
	            out.println("</html>");
	             
	        } catch  (Exception e){
	            out.println(e);
	        }

	}

}
