<%-- 
    Document   : updatedetails
    Created on : 18 Aug, 2017, 5:20:46 PM
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
        try
        {
         String address =request.getParameter("address");
         %>
         <form action="update.jsp">
             <pre>
         EMAIL:<input type="text" name="email">

         CITY:<input type="text" name="city"/>

         AREA:<select  name="area">
        <option value="BHAWARKUA">BHAWARKUA</option>
        <option value="SAPNA SNGEETA">SAPNA SNGEETA</option>
        <option value="LIG">LIG</option>
        <option value="VIJAY NAGAR">VIJAY NAGAR</option>
        <option value="MAHUNAKA">MAHUNAKA</option>
        <option value="PALASIA">PALASIA</option>
          </select>

     CATEGORY:<select  name="category">
 <option value="GIRLS">GIRLS</option>
<option value="BOYS">BOYS</option>
<option value="FAMILY">FAMILY</option>
</select>

PROPERTY TYPE:<select name="propertytype">
        <option value="FLAT">FLAT</option>
        <option value="ROOM">ROOM</option>
        <option value="PG">PG</option>
        <option value="OFFICE">OFFICE</option>
        <option value="HOME">HOME</option>
        <option value="HOSTEL">HOSTEL</option>
        </select>

       ADDRESS:<input type="hidden" name="address" value="<%=address%>"/>

         ROOMS:<select name="rooms">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             </select>

       SHARING:<select name="sharing">
             <option value="SINGLE">SINGLE</option>
             <option value="2 SHARING">2 SHARING</option>
             <option value="3 SHARING">3 SHARING</option>
             <option value="4 SHARING">4 SHARING</option>
             </select>

        OPTION:  RENTAL<input type="radio" name="selectoption" value="rental"/>    PURCHASE<input type="radio" name="selectoption" value="purchase"/>  RENTAL/PURCHASE<input type="radio" name="selectoption" value="rental/purchase"/>

  RENTAL PRICE:<input type="text" name="rentalprice"/>

PURCHASE PRICE:<input type="text" name="purchaseprice"/>

    FACILITIES:<input type="textarea" name="facilities"/>

  RESTRICTIONS:<input type="textarea" name="restrictions"/>

      <input type="submit" name="submit" value="UPDATE"/>


          </pre>
         </form>
            
            
       <% }
        catch(Exception e) {
        out.println(e);
        }
%>



    </body>