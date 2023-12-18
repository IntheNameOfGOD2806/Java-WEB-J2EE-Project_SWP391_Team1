<%-- 
    Document   : register
    Created on : Oct 30, 2023, 8:14:19 AM
    Author     : adm
--%>
<!--

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">


    <head>

<!-- META ============================================= -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="robots" content="" />

<!-- DESCRIPTION -->
<meta name="description" content="EduChamp : Education HTML Template" />

<!-- OG -->
<meta property="og:title" content="EduChamp : Education HTML Template" />
<meta property="og:description" content="EduChamp : Education HTML Template" />
<meta property="og:image" content="" />
<meta name="format-detection" content="telephone=no">

<!-- FAVICONS ICON ============================================= -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

<!-- PAGE TITLE HERE ============================================= -->
<title>Register</title>

<!-- MOBILE SPECIFIC ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--[if lt IE 9]>
<script src="assets/js/html5shiv.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->

<!-- All PLUGINS CSS ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/assets.css">

<!-- TYPOGRAPHY ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/typography.css">

<!-- SHORTCODES ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

<!-- STYLESHEETS ============================================= -->
<link rel="stylesheet" type="text/css" href="assets/css/style1.css">
<link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

</head>
<body id="bg">
    <div class="page-wraper">
        <div id="loading-icon-bx"></div>
        <div class="account-form">
            <div class="account-head" style="background-image:url(assets/images/background/bg2.jpg);">
                <a href="#"><img src="landlord/assets/images/logo_real_white.png" alt=""></a>
            </div>
            <div class="account-form-inner">
                <div class="account-container">
                    <div class="heading-bx left">
                        <h2 class="title-head">Sign Up <span>Now</span></h2>
                        <p>Login Your Account <a href="login">Click here</a></p>
                    </div>
                    <%//if (request.getAttribute("checkmail") == null) {%>
                    <form class="contact-bx" action="register" method="post">
                        <%
                            String userName = (String) session.getAttribute("userName");
                            String fullName = (String) session.getAttribute("fullName");
                            String phone = (String) session.getAttribute("phone");
                            String email = (String) session.getAttribute("email");
                            String dob = (String) session.getAttribute("dob");
                            String gender = (String) session.getAttribute("gender");
                            String password = (String) session.getAttribute("password");
                            String re_password = (String) session.getAttribute("re_password");

                            // Nếu giá trị là null, gán giá trị mặc định là ""
                            userName = (userName == null) ? "" : userName;
                            fullName = (fullName == null) ? "" : fullName;
                            phone = (phone == null) ? "" : phone;
                            email = (email == null) ? "" : email;
                            dob = (dob == null) ? "" : dob;
                            gender = (gender == null) ? "" : gender;
                            password = (password == null) ? "" : password;
                            re_password = (re_password == null) ? "" : re_password;
                        %>
                        <div class="row placeani">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <label>Your Username</label>
                                        <input name="userName" type="text" required="" class="form-control" value="<%= userName != null ? userName : "" %>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <label>Your Full Name</label>
                                        <input name="fullName" type="text" required="" class="form-control" value="<%= fullName != null ? fullName : "" %>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <label>Your Phone Number</label>
                                        <input name="phone" type="number" required="" class="form-control" value="<%= phone != null ? phone : "" %>">
                                    </div>
                                </div>
                            </div>
                            <c:if test="${error_mail eq 'email-existed'}">
                                <h5 style="color: red">Mail đã tồn tại</h5>
                            </c:if>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <label>Your Email Address</label>
                                        <input name="email" type="email" required="" class="form-control" value="<%= email != null ? email : "" %>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <label>Your Birthday</label>
                                        <input name="dob" type="date" required="" class="form-control" value="<%= dob != null ? dob : "" %>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div>
                                        <h5>Gender</h5>
                                        <input type="radio" id="html" name="gender" value="1" checked="" <%= (gender == null || gender.equals("1")) ? "checked" : "" %>>
                                          <label for="html">Male</label><br>
                                        <input type="radio" id="html" name="gender" value="0" <%= (gender != null && gender.equals("0")) ? "checked" : "" %>>
                                          <label for="html">Female</label><br>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div> 
                                        <label>Your Password</label>
                                        <input name="password" type="password" class="form-control" required="" value="<%= password != null ? password : "" %>">
                                    </div>
                                </div>
                            </div>
                            <c:if test="${error_repass eq 'pass-unmatched'}">
                                <h5 style="color: red">Mật khẩu không khớp</h5>
                            </c:if>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div> 
                                        <label>Confirm Password</label>
                                        <input name="re_password" type="password" class="form-control" required="" value="<%= re_password != null ? re_password : "" %>">
                                    </div>
                                </div>
                            </div>
                            <c:if test="${error_account eq 'account-existed'}">
                                <h5 style="color: red">Tài khoản đã tồn tại</h5>
                            </c:if>
                            <div class="col-lg-12 m-b30">
                                <button name="submit" type="" value="" class="btn button-md">Register</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- External JavaScripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
    <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
    <script src="assets/vendors/counter/waypoints-min.js"></script>
    <script src="assets/vendors/counter/counterup.min.js"></script>
    <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
    <script src="assets/vendors/masonry/masonry.js"></script>
    <script src="assets/vendors/masonry/filter.js"></script>
    <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
    <script src="assets/js/functions.js"></script>
    <script src="assets/js/contact.js"></script>
</body>

</html>



