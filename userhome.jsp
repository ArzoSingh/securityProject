<%-- 
    Document   : userhome
    Created on : 14 Aug, 2017, 12:34:34 PM
    Author     : NPC
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
            String email=(String)session.getAttribute("uid");
            out.println(email);
            String city=request.getParameter("city");
            String area=request.getParameter("area");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr="select * from property where city=? and area=?";
            PreparedStatement ps=con.prepareStatement(qr);
            ps.setString(1, city);
            ps.setString(2, area);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
              {
            session.setAttribute("city",city);
            session.setAttribute("area",area);
            response.sendRedirect("search.jsp");
               }
             else
            {
             out.println("invalid city or area");
             }
             }
             catch (Exception e)
             {
              out.println(e);
             }
         %>
    </body>
</html>
