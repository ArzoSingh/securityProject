<%-- 
    Document   : update
    Created on : 18 Aug, 2017, 6:03:16 PM
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
    <body>
        <%
         try {
            String email =request.getParameter("email");
            String city =request.getParameter("city");
            String area =request.getParameter("area");
            String category =request.getParameter("category");
            String propertytype =request.getParameter("propertytype");
            String address =request.getParameter("address");
            String r =request.getParameter("rooms");
            int rooms=Integer.parseInt(r);
            String sharing =request.getParameter("sharing");
            String selectoption =request.getParameter("selectoption");
            String rentalprice =request.getParameter("rentalprice");
            String purchaseprice =request.getParameter("purchaseprice");
            String facilities =request.getParameter("facilities");
            String restrictions =request.getParameter("restrictions");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr= "update property set email=?,city=?,area=?,category=?,propertytype=?,rooms=?,sharing=?,selectoption=?,rentalprice=?,purchaseprice=?,facilities=?,restrictions=? where address=?";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(13,address);
            ps.setString(1,email);
            ps.setString(2,city);
            ps.setString(3,area);
            ps.setString(4,category);
            ps.setString(5,propertytype);
            ps.setInt(6,rooms);
            ps.setString(7,sharing);
            ps.setString(8,selectoption);
            ps.setString(9,rentalprice);
            ps.setString(10,purchaseprice);
            ps.setString(11,facilities);
            ps.setString(12,restrictions);
           
            ps.executeUpdate();
            response.sendRedirect("showdetails.jsp");

        }
         catch(Exception e) {
            out.println(e);
        }
         %>
    </body>
</html>
