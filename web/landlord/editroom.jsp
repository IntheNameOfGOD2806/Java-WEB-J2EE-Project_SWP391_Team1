<%-- 
    Document   : create-house
    Created on : Sep 17, 2023, 3:44:43 PM
    Author     : trant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>edit room Page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css"> 
        <link rel="stylesheet" href="assets/css/wizard.css"> 
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
    </head>
    <body>
     
        <!-- Body content -->

              
        <!--End top header -->

  
        <div class="container">
            <h1>Update Room </h1>
            <form action="editroom" method="POST">
                  <div style="display: none" class="form-group">
                   
                    <input type="number" class="form-control" id="description" name="roomid" value="${requestScope.room.getRoomID()}" required>
                </div>
                <div class="form-group">
                    <label for="description">Price:</label>
                    <input type="number" class="form-control" id="description" name="price" value="${requestScope.room.getPrice()}" required>
                </div>

              <div class="form-group">
                    <label for="location">Description: </label>
                    <input type="text" class="form-control" id="location" name="description" value="${requestScope.room.getDescription()}" required>
                </div>
                <div class="form-group">
                    <label for="location">Area</label>
                    <input type="number" class="form-control" id="city" name="area" value="${requestScope.room.getArea()}" required>
                </div>
                 <div class="form-group">
                    <label for="location">Current status: </label>
                    <span >${requestScope.room.getStatus()}</span>
                  
                </div>
               
             
<!--                     <c:if test="${requestScope.room.getStatus() eq 'Hired'}   " >
                         <input type="text" name="status" value="1">
                     </c:if>
                     <c:if test="${requestScope.room.getStatus() eq 'Active'}   " >
                        <input type="text" name="status" value="0">

                     </c:if>
                   -->
                    
                
                    
                <!-- Location -->
               
                <button type="submit" class="btn btn-primary">Update Room Information</button>
               
            </form>
        </div>


        <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="assets/js//jquery-1.10.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>
        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>
        <script src="assets/js/icheck.min.js"></script>

        <script src="assets/js/price-range.js"></script> 
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

        <script src="assets/js/main.js"></script>


    </body>
</html>