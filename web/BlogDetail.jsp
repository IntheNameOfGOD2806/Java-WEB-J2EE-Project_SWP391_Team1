<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="model.Blog,java.util.List,model.Profile,dal.ProfileDAO,java.sql.ResultSet, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>


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
        <link rel="icon" href="marketing/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Blog Detail</title>

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
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>

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
                                        <li><a id="profile-link-id" href="profile">Hello, <%=feedbackDAO3.getProfileByAccountId(aId).getFullName()%></a></li>
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
                                    </ul>
                                </div>
                            </div>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="home"><img src="assets/images/logo_real.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav">
                                    <li><a href="home">Home </a>
                                    </li>
                    <!--IMPORTANT-->
                                    <li class="add-mega-menu"><a href="viewhouses">View Houses</i></a>
                                        <ul class="sub-menu add-menu">
                                            <li class="add-menu-left">
                                                <h5 class="menu-adv-title">View Houses</h5>
                                                <ul>
                                                    <li><a href="#">Mini Apartment</a></li>
                                                    <li><a href="#">Homestay</a></li>
                                                    <li><a href="#">Motel</a></li>
                                                </ul>
                                            </li>
                                            <li class="add-menu-right">
                                                <img src="assets/images/adv/adv.jpg" alt=""/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="ViewBlog">Blog </a>
                                    </li>
                    <!--IMPORTANT-->
                                    <c:set var = "accountInfo" value = "${sessionScope.account}"/>
                                    <c:if test="${accountInfo.getRoleId() == 3}">
                                   <li><a href="DashBoard">Dashboard</a></li>
                                   </c:if>
                                    <c:if test="${accountInfo.getRoleId() == 4}">
                                   <li><a href="MKTDashBoard">Dashboard</a></li>
                                   </c:if>
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
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(marketing/assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Blog Details</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#">Home</a></li>
                            <li>Blog Details</li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <% 
List<Blog> Bl = (List<Blog>)request.getAttribute("dataBl");
List<Blog> top3 = (List<Blog>)request.getAttribute("top3");
                %> 
                <div class="content-block">
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <!-- Left part start -->
                                <div class="col-lg-8 col-xl-8">
                                    <!-- blog start -->
                                    <%for(Blog BL: Bl){%>
                                    <div class="recent-news blog-lg">
                                        <div class="action-box blog-lg">
                                            <img src="<%=BL.getPhoto()%>" alt="">
                                        </div>
                                        <div class="info-bx">
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i><%=BL.getCreateDate()%></a></li>
                                            </ul>
                                            <h5 class="post-title"><a href="#"><%=BL.getTitle()%></a></h5>
                                            <p><%=BL.getContent()%></p>
                                            <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>


                                        </div>
                                    </div>
                                    <%}%>

                                    <!-- blog END -->
                                </div>
                                <!-- Left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 col-xl-4" >
                                    <aside  class="side-bar">
                                        <div class="widget recent-posts-entry" >
                                            <h6 >Recent Posts</h6>
                                            <div class="widget-post-bx">
                                                <%for(Blog top: top3){%>
                                                <div class="widget-post clearfix" >
                                                    <div class="ttr-post-media"> <img src="<%=top.getPhoto()%>" width="200" height="143" alt="" > </div>
                                                    <div class="ttr-post-info">
                                                        <div class="ttr-post-header">
                                                            <h6 class="post-title"><a href="BlogDetail?BlogID=<%=top.getBlogId()%>"><%=top.getTitle()%></a></h6>
                                                        </div>
                                                        <ul class="media-post">
                                                            <li><a href="#"><i class="fa fa-calendar"></i><%=top.getCreateDate()%></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>



                                    </aside>
                                </div>
                                <!-- Side bar END -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <footer>
                <div class="footer-top">
                    <div class="pt-exebar">
                        <div class="container">
                            <div class="d-flex align-items-stretch">
                                <div class="pt-logo mr-auto">
                                    <a href="#"><img src="assets/images/logo_real_white.png" alt=""></a>
                                </div>
                                <div class="pt-social-link">
                                    <ul class="list-inline m-a0">
                                        <li><a href="#" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#" class="btn-link"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="#" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

        </div>
    </footer>
    <!-- Footer END ==== -->
    <!-- scroll top button -->
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
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
<script src="marketing/assets/js/functions.js"></script>
<script src="marketing/assets/js/contact.js"></script>
</body>

</html>