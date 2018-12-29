<%-- 
    Document   : ldadd
    Created on : 14 Aug, 2017, 12:48:41 PM
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
            String qr= "insert into property (email,city,area,category,propertytype,address,rooms,sharing,selectoption,rentalprice,purchaseprice,facilities,restrictions) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(1,email);
            ps.setString(2,city);
            ps.setString(3,area);
            ps.setString(4,category);
            ps.setString(5,propertytype);
            ps.setString(6,address);
            ps.setInt(7,rooms);
            ps.setString(8,sharing);
            ps.setString(9,selectoption);
            ps.setString(10,rentalprice);
            ps.setString(11,purchaseprice);
            ps.setString(12,facilities);
            ps.setString(13,restrictions);
            ps.executeUpdate();
            response.sendRedirect("home1.jsp");

        }
         catch(Exception e) {
            out.println(e);
        }
         %>
    </body>
</html>
