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
                
                <div class="col-lg-5">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Add Flower</h1>
                        </div>
                        <div class="card-body rounded-bottom bg-white p-5">
                            <form action="addflower" method="POST">
                                <div class="form-group">
                                    Name:
                                    <input type="text" name="name" class="form-control p-4" placeholder="Enter Flower name" required/>
                                </div>
                                <div class="form-group">
                                    Scientific Name:
                                    <input type="text" name="sname" class="form-control p-4" placeholder="Enter Flower Scientific name" required/>
                                </div>
                                <div class="form-group">
                                    Photo:
                                    <input type="file" name="photo" class="form-control p-4" required/>
                                </div>
                                <div class="form-group">
                                    Soil:
                                    <input type="text" name="soil" class="form-control p-4" placeholder="Enter Soil type" required/>
                                </div>
                                <div class="form-group">
                                    Medicine Needed:
                                    <input type="text" name="medicine" class="form-control p-4" placeholder="Enter Medicines It may Need" required/>
                                </div>
                                <div class="form-group">
                                    Growth Duration:
                                    <input type="text" name="growth" class="form-control p-4" placeholder="Enter Duration Of Growth" required/>
                                </div>
                                <div class="form-group">
                                    Uses:
                                    <input type="text" name="uses" class="form-control p-4" placeholder="Enter Uses Of Flower" required/>
                                </div>
                                <div class="form-group">
                                    Fertilizes Needed:
                                    <input type="text" name="fertilizer" class="form-control p-4" placeholder="Enter Fertilizers needed" required/>
                                </div>
                                <div class="form-group">
                                    Weather:
                                    <input type="text" name="weather" class="form-control p-4" placeholder="Enter Weather To Grow" required/>
                                </div>
                                <div>
                                    <input class="btn btn-primary btn-block py-3" type="submit" value="ADD"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Flower list</h1>
                            <div class="card-body rounded-bottom bg-white">
                                <table border="1" width="100%">
                                    <tr style="background: #7F8181;color: #ffffff"><th>Name</th><th>Scientific Name</th><th>Photo</th><th></th></tr>
                         <%
                             try  {
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=new DBConfig().getConnection();
            Statement sta=con.createStatement();
            
            ResultSet res=sta.executeQuery("SELECT * FROM `flowers`");
            int slno=0;
            while(res.next())
            {
                String id=res.getString("id");
                String name=res.getString("name");
                String scientificname=res.getString("scientificname");
                String photo="images/"+res.getString("photo");
                
                out.println("<tr><td>"+name+"</td><td>"+scientificname+"</td><td><img src='"+photo+"' style=\"width:100px;\"></td><td><a href='flowerdetails.jsp?id="+id+"'><img src='img/next.png' style=\"width:25px;\"></a> <img src='img/deleteicon.jpg' style=\"width:25px;\" onclick='Delflower("+id+")'></td></tr>");
                
            }
        }
        catch(Exception e){
            out.println(e);
        }
                             %>
                        </table>
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
<script>
    function Delflower(id)
      {
          var txt;
          var r=confirm("Do you really want to Delete Flower?");
          if(r==true)
          {
              window.location.replace("delflower?id="+id+"");
          }
          else
          {

          }
          document.getElementById("demo").innerHTML=txt;
      }
      </script>
    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>