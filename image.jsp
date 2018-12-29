<%--
    Document   : image.jsp
    Created on : Aug 11, 2017, 8:54:48 AM
    Author     : ppoint
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
 String image=request.getParameter("image");
 String email=(String)session.getAttribute("email");
  try {

    Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");

String qr="update property set image=? where email=?";

PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, image);
ps.setString(2, email);

ps.executeUpdate();

response.sendRedirect("");



        } catch(Exception e) {
            out.println(e);
        }




%>
    </body>
</html>
