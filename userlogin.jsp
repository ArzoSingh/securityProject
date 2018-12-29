<%-- 
    Document   : userlogin
    Created on : 14 Aug, 2017, 12:41:58 PM
    Author     : NPC
--%>

<%@page import="java.sql.ResultSet"%>
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
    <body>
        <%
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
            session.setAttribute("uid",email);
            response.sendRedirect("userhome.html");
               }
             else
            {
             out.println("invalid id and password");
             }
             }
             catch (Exception e)
             {
              out.println(e);
             }

           %>
    </body>
</html>
