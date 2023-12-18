<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account,model.Profile,dal.AccountDAO,java.sql.ResultSet, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>

<html lang="en" >
    <head>
        <meta charset="utf-8">


        <title>profile with data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
                margin-left: 200px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }

        </style>
    </head>
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
        <link rel="icon" href="marketing/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>View Blog</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="marketing/assets/js/html5shiv.min.js"></script>
        <script src="marketing/assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="marketing/assets/css/color/color-1.css">
    </head>
    <!-- Header Top ==== -->
    <header class="header rs-nav header-transparent" style="z-index: 5;background-color:rgba(2, 0, 11, 0.80);border-color:rgba(0, 0, 0, 0);border-width:0px;">
        <div class="top-bar">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="topbar-left">
                        <ul>
                            <li><a href="mailto:huytbn@gmail.com"><i class="fa fa-envelope-o"></i>support@muonnha.vn</a></li>
                        </ul>
                    </div>
                    <div class="topbar-right">
                        <ul>
                            <!-- LINK LOGIN Ở ĐÂY NÀY ==== -->
                            <c:set var = "accountId" value = "${sessionScope.accountid}"/>
                            <c:if test="${not empty accountId}">
                                <% 
                                    int aId = (int)pageContext.getAttribute("accountId");     
                                %>
                                <%
                                    FeedbackDAO feedbackDAO3 = new FeedbackDAO();
                                %>
                                <li><a href="profile">Hello, <%=feedbackDAO3.getProfileByAccountId(aId).getFullName()%></a></li>
                                <li><a href="logout">Log out</a></li>
                                </c:if>
                                <c:if test="${empty accountId}">
                                <li><a href="login">Login</a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sticky-header navbar-expand-lg">
            <div class="menu-bar clearfix">
                <div class="container clearfix">
                    <!-- Header Logo ==== -->
                    <div class="menu-logo">
                        <a href="#"><img src="assets/images/logo_real_white.png" alt=""></a>
                    </div>
                    <!-- Mobile Nav Button ==== -->
                    <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <!-- Author Nav ==== -->
                    <div class="secondary-menu">
                        <div class="secondary-inner">
                            <ul>
                                <li><a href="javascript:;" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="javascript:;" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="javascript:;" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                <!-- Search Button ==== -->
                                <li class="search-btn"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Search Box ==== -->
                    <div class="nav-search-bar">
                        <form action="#">
                            <input name="search" value="" type="text" class="form-control" placeholder="Type to search">
                            <span><i class="ti-search"></i></span>
                        </form>
                        <span id="search-remove"><i class="ti-close"></i></span>
                    </div>
                    <!-- Navigation Menu ==== -->
                    <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                        <div class="menu-logo">
                            <a href="home"><img src="assets/images/logo_real_white.png" alt=""></a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li><a href="home">Home </a>
                            </li>
                            <li class="add-mega-menu"><a href="#">View Houses</i></a>
                                <ul class="sub-menu add-menu">
                                    <li class="add-menu-left">
                                        <h5 class="menu-adv-title">View Houses</h5>
                                        <ul>
                                            <li><a href="#">House vip </a></li>
                                            <li><a href="#">Courses Details</a></li>
                                            <li><a href="#">Instructor Profile</a></li>
                                            <li><a href="#">Upcoming Event</a></li>
                                            <li><a href="#">Membership</a></li>
                                        </ul>
                                    </li>
                                    <li class="add-menu-right">
                                        <img src="assets/images/adv/adv.jpg" alt=""/>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="ViewBlog">Blog </a>
                            </li>
                            <li><a href="#">Dashboard</a>
                            </li>
                        </ul>
                        <div class="nav-social-link">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                    <!-- Navigation Menu END ==== -->
                </div>
            </div>
        </div>
    </header>

        <body>
        <% 
Profile profile =(Profile)request.getAttribute("dataprofile");
        %>
        <div class="container" style="padding-top : 190px">
            <div class="main-body">


                <div class="row gutters-sm">


                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="<%=profile.getPhoto()%>"  id="uploadedPhoto" alt="Uploaded Image" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4><%=profile.getFullName()%></h4>
                                        <p class="text-secondary mb-1">Tenant</p>

                                        <input type="file" id="inputPhoto" style="padding-left: 50px"/>
                                        <input type="hidden" id="imageInput" class="col-12"/>




                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-8">
                        <div class="card mb-3">
                            <form action="edit" method="post">
                                <input value="<%=profile.getPhoto()%>" id="Photo" name="Photo" type="hidden"/>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getFullName()%>" type="text" name="fullname" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getEmail()%>" type="text" name="email" required=""/>

                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getPhone()%>" type="text" name="phone" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Date Of Birth</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getDOB()%>" type="date" name="DOB" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>

                                        <div class="col-sm-9 text-secondary">
                                            <%if(profile.getGender()==1){%>
                                              <input type="radio" id="html" name="gender" value="1" checked="">
                                              <label for="html">Male</label><br>
                                              <input type="radio" id="css" name="gender" value="0" />
                                              <label for="css">Female</label><br>
                                            <%}else{%>
                                              <input type="radio" id="html" name="gender" value="1" >
                                              <label for="html">Male</label><br>
                                              <input type="radio" id="css" name="gender" value="0" checked=""/>
                                              <label for="css">Female</label><br>
                                            <%}%>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <input type="submit" class="btn btn-success" value="Save" name="submit"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="row gutters-sm">

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <script src="marketing/assets/js/jquery.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="marketing/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="marketing/assets/vendors/counter/waypoints-min.js"></script>
        <script src="marketing/assets/vendors/counter/counterup.min.js"></script>
        <script src="marketing/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="marketing/assets/vendors/masonry/masonry.js"></script>
        <script src="marketing/assets/vendors/masonry/filter.js"></script>
        <script src="marketing/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="marketing/assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="marketing/assets/js/functions.js"></script>
        <script src="marketing/assets/vendors/chart/chart.min.js"></script>
        <script src="marketing/assets/js/admin.js"></script>
        <script src="marketing/assets/js/uploadimage.js"></script>

    </body>
</html>