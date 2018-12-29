<%-- 
    Document   : userrg
    Created on : 14 Aug, 2017, 12:13:01 PM
    Author     : NPC
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
        <%
         try {
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String address=request.getParameter("address");
            String contact=request.getParameter("contact");
            String dob=request.getParameter("dob");
            String profession=request.getParameter("profession");
            String gender=request.getParameter("gender");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
            String qr= "insert into userrg values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps= con.prepareStatement(qr);
            ps.setString(1,firstname);
            ps.setString(2,lastname);
            ps.setString(3,email);
            ps.setString(4,password);
            ps.setString(5,address);
            ps.setString(6,contact);
            ps.setString(7,dob);
            ps.setString(8,profession);
            ps.setString(9,gender);
            ps.executeUpdate();
            response.sendRedirect("userlogin.html");


        } catch(Exception e) {
            out.println(e);
        }
    %>
    </body>
</html>
