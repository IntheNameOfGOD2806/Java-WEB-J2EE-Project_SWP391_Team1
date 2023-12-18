<%-- 
    Document   : ChangePassword
    Created on : Oct 5, 2023, 3:30:26 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account,model.Profile,dal.AccountDAO,java.sql.ResultSet, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
    .pass_show{
        position: relative
    }

    .pass_show .ptxt {

        position: absolute;

        top: 50%;

        right: 10px;

        z-index: 1;

        color: #f36c01;

        margin-top: -10px;

        cursor: pointer;

        transition: .3s ease all;

    }

    .pass_show .ptxt:hover{
        color: #333333;
    }
</style>
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
<!-- Header Top END ==== -->
<div class="container">
    <div class="row">
        <div class="col-sm-4" style="    margin: auto;
             margin-top: 200px;">
            <form action="change" method="post">
                <h3>Change Password Form</h3>
                <h5 style="color: red">${requestScope.ms}</h5>
                <h5 style="color: red">${requestScope.re}</h5>
                <label>Current Password </label>
                <div class="form-group pass_show"> 
                    <input  name="oldpassword" type="password" class="form-control" placeholder="Current Password"> 
                </div>
                <input type="hidden" name="username" value="${sessionScope.name}"/>
                <label>New Password</label>
                <div class="form-group pass_show"> 
                    <input name="newpassword" type="password" class="form-control" placeholder="New Password"> 
                </div> 
                <label>Confirm Password</label>
                <div class="form-group pass_show"> 
                    <input name="repassword" type="password" class="form-control" placeholder="Confirm Password"> 
                </div>
                <input class="btn btn-default" type="submit" value="Change"/>
                <h5 style="color: red">${requestScope.sucess}</h5>

            </form>
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
<script>
    $(document).ready(function () {
        $('.pass_show').append('<span class="ptxt">Show</span>');
    });
    $(document).on('click', '.pass_show .ptxt', function () {

        $(this).text($(this).text() == "Show" ? "Hide" : "Show");
        $(this).prev().attr('type', function (index, attr) {
            return attr == 'password' ? 'text' : 'password';
        });
    });
</script>

