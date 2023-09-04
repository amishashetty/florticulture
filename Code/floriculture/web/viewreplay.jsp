<%@page import="database.DBConfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<%
    String username=null;
     try{
         HttpSession hs=request.getSession();
         username=hs.getAttribute("username").toString();
         String password=hs.getAttribute("password").toString();
         
         if(username.equals("") || username.equals(null) || password.equals("") || password.equals(null))
         {
              response.sendRedirect("user.jsp");
         }
         else{
             
         }
     }
     catch(Exception e){
         response.sendRedirect("adminlogout");
     }
     
     
%>
<head>
    <meta charset="utf-8">
    <title>Floriculture</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    

    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">Floriculture</span>Manager</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="flower.jsp" class="nav-item nav-link">Flowers</a>
                        <a href="fertilizer.jsp" class="nav-item nav-link">Fertilizer</a>
                        <a href="updates.jsp" class="nav-item nav-link">Add Updates</a>
                        <a href="requests.jsp" class="nav-item nav-link">User Requests</a>
                        <a href="adminlogout" class="nav-item nav-link">Logout</a>
                        
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


 


    <!-- Registration Start -->
    <div class="container-fluid bg-registration py-5" style="margin: 90px 0;">
        <div class="container py-5">
            <div class="row align-items-center">
                
               
                <div class="col-lg-12 mb-5 mb-lg-0">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Pending Queries</h1>
                            <div class="card-body rounded-bottom bg-white">
                                
                         <%
     String id=request.getParameter("id");
                             try  {
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=new DBConfig().getConnection();
            Statement sta=con.createStatement();
            
            ResultSet res=sta.executeQuery("SELECT * FROM `request` WHERE `id`='"+id+"'");
            while(res.next())
            {
                
                String subject=res.getString("subject");
                String description=res.getString("description");
                String farmerid=res.getString("farmerid");
                String answer=res.getString("answer");
                Class.forName("com.mysql.jdbc.Driver");
            Connection con1=new DBConfig().getConnection();
            Statement sta1=con1.createStatement();
            
            ResultSet res1=sta1.executeQuery("SELECT * FROM `user` WHERE `phno`='"+farmerid+"'");
            String farmername=null;
            while(res1.next())
            {
                farmername=res1.getString("name");
            }
                out.println("<p>Subject: "+subject+"<br>Description: "+description+"<br>Farmer Name: "+farmername+"<br>Phone Number: "+farmerid+"<br>Answer: "+answer+"</p>");
                
            }
        }
        catch(Exception e){
            out.println(e);
        }
                             %>
                       
                            </div>
                        </div>
                    </div>
                </div>
                        
                        
            </div>
        </div>
    </div>
    <!-- Registration End -->





    <!-- Footer Start -->
    
    <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="row">
            <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                <p class="m-0 text-white-50">Developed By<a href="#"> Students</a>
                </p>
            </div>
            
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>