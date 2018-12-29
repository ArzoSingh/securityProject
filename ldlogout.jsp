<%-- 
    Document   : ldlogout
    Created on : 14 Aug, 2017, 12:45:17 PM
    Author     : NPC
--%>

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
           
            session.invalidate();
            response.sendRedirect("ld login.html");


        } catch(Exception e)
        {
            out.println(e);
        }
    
    %>
    </body>
</html>
