<%-- 
    Document   : deleteuser
    Created on : 23 Aug, 2017, 12:48:15 PM
    Author     : NPC
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><
         <%
        try
            {
            String email=request.getParameter("email");
            out.println(email);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root")   ;
            String qr="delete from userrg where email=? ";
            PreparedStatement ps=con.prepareStatement(qr);
            ps.setString(1,email);
            ps.executeUpdate();
            response.sendRedirect("adminuser.jsp");
            }
        catch(Exception e)
            {
            out.println(e);
            }

        %>
    </body>
</html>
