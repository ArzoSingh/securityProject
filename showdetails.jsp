<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Security</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
		</head>
		<body>

			  <header id="header" id="home">
			  	<div class="container header-top">
			  		<div class="row">
				  		<div class="col-6 top-head-left">				  			
				  			<ul>
		  						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
				  			</ul>
				  		</div>
				  		<div class="col-6 top-head-right">
				  			<ul>
				  				<li><a href="tel:+880 012 3654 896"><span>+880 012 3654 896</span> <span class="lnr lnr-phone-handset"></span></a></li>
				  				<li><a href="#">Register / Login</a></li>
				  			</ul>
				  		</div>			  			
			  		</div>
			  	</div>
			  	<hr>
			    <div class="container">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo">
				        <a href="index.html"><img src="" alt="" title="" /></a>
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li class="menu-active"><a href="index.html">Home</a></li>
				          <li><a href="about.html">About Us</a></li>
				          
				          <li><a href="showdetails.jsp">Show Details</a></li>
				          <li><a href="adminuser.jsp">User Details</a></li>
				          	<li><a href="ldlogout">Logout</a></li>
				         <a href="contact.html">Contact</a></li>		          
				        </ul>
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>
			  </header><!-- #header -->

			<!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>	
				<div class="container">
					<div class="row fullscreen d-flex align-items-center justify-content-start">
						<div class="banner-content col-lg-9">
							<h6 class="text-white">Openning on 21st MAY, 2018</h6>
							<h1 class="text-white">
								The HOMESEEKER				
							</h1>
							<p class="pt-20 pb-20 text-white">
								What made you want to look up HOMESEEKER? Please tell us where you read or heard it (including the quote, if possible)...
							</p>
							<a href="#" class="primary-btn text-uppercase">Get Started</a>
						</div>											
					</div>
				</div>					
			</section>
			<!-- End banner Area -->	

			<!-- Start service Area -->
			<section class="service-area section-gap" id="service">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">Property Details</h1>
								<p>Property, in the abstract, is what belongs to or with something, whether as an attribute or as a component of said thing.</p>
							</div>
						</div>
					</div>
					
            
          <h1 align="center">DETAILS</h1>
                   <%try{
           String email= (String)session.getAttribute("ldid");
           out.println(email);
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
           String qr="select * from property where email=?";
           PreparedStatement ps=con.prepareStatement(qr);
           ps.setString(1,email);
           ResultSet rs =ps.executeQuery();
           
        %>
            <table border=1px align=center>
             <th>CITY</th>
             <th>AREA</th>
             <th>CATEGORY</th>
             <th>PROPERTY TYPE</th>
             <th>ADDRESS</th>
             <th>ROOMS</th>
             <th>SHARING</th>
             <th>OPTION</th>
             <th>RENTAL PRICE</th>
             <th>PURCHASE PRICE</th>
             <th>FACILITIES</th>
             <th>RESTRICTIONS</th>
              
             <th>DELETE</th>
             <th>UPDATE</th>
             <%
            while(rs.next())
            {
          
            String city=rs.getString("city");
            String area=rs.getString("area");
            String category=rs.getString("category");
            String propertytype=rs.getString("propertytype");
            String address=rs.getString("address");
            String rooms=rs.getString("rooms");
            String sharing=rs.getString("sharing");
            String selectoption=rs.getString("selectoption");
            String rentalprice=rs.getString("rentalprice");
            String purchaseprice=rs.getString("purchaseprice");
            String facilities=rs.getString("facilities");
            String restrictions=rs.getString("restrictions");

             
             %>
          <tr>
            <td><%=city%></td>
            <td><%=area%></td>
            <td><%=category%></td>
            <td><%=propertytype%></td>
            <td><%=address%></td>
            <td><%=rooms%></td>
            <td><%=sharing%></td>
            <td><%=selectoption%></td>
            <td><%=rentalprice%></td>
            <td><%=purchaseprice%></td>
            <td><%=facilities%></td>
            <td><%=restrictions%></td>
            <td><img src="image1"height='10%' width='50%'/></td>
            <td><img src="image2"height='10%' width='50%'/></td>
            <td><img src="image3"height='10%' width='50%'/></td>
            <td><img src="image4"height='10%' width='50%'/></td>
            <td><img src="image5"height='10%' width='50%'/></td>

            <td><a href="deletedetails.jsp?address=<%=address%>">DELETE</a></td>
            <td><a href="updatedetails.jsp?address=<%=address%>">UPDATE </a></td>
        </tr>
            <%
            }
             con.close();
              %>
                      </table>
                      <%
               } catch(Exception e){
                        out.println(e);
                    }
                     %>

          			</div>	
			</section>
			<!-- End service Area -->	


						

			<!-- start footer Area -->		
			<footer class="footer-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-6 col-sm-6">
							<div class="single-footer-widget">
								<h6>About Us</h6>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.
								</p>
								<p class="footer-text">
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>								
							</div>
						</div>
						<div class="col-lg-5  col-md-6 col-sm-6">
							<div class="single-footer-widget">
								<h6>Newsletter</h6>
								<p>Stay update with our latest</p>
								<div class="" id="mc_embed_signup">
									<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">
										<input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">
			                            	<button class="click-btn btn btn-default"><span class="lnr lnr-arrow-right"></span></button>
			                            	<div style="position: absolute; left: -5000px;">
												<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
											</div>

										<div class="info"></div>
									</form>
								</div>
							</div>
						</div>						
						<div class="col-lg-2 col-md-6 col-sm-6 social-widget">
							<div class="single-footer-widget">
								<h6>Follow Us</h6>
								<p>Let us be social</p>
								<div class="footer-social d-flex align-items-center">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-dribbble"></i></a>
									<a href="#"><i class="fa fa-behance"></i></a>
								</div>
							</div>
						</div>							
					</div>
				</div>
			</footer>	
			<!-- End footer Area -->		

			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>	
			<script src="js/owl.carousel.min.js"></script>			
			<script src="js/jquery.sticky.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>	
			<script src="js/waypoints.min.js"></script>
			<script src="js/jquery.counterup.min.js"></script>					
			<script src="js/parallax.min.js"></script>		
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>	
		</body>
	</html>






