<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account,model.Profile,dal.AccountDAO,java.sql.ResultSet, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en" >
    <head>
        <meta charset="utf-8">


        <title>Profile</title>
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
    <div class="container" style="padding-top : 190px">
        <div class="main-body">
            <% 
    Account account =(Account)request.getAttribute("dataaccount");
    Profile profile =(Profile)request.getAttribute("dataprofile");
            %>
            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="<%=profile.getPhoto()%>" alt="Admin" class="rounded-circle" width="150">
                                <div class="mt-3">
                                    <h4><%=profile.getFullName()%></h4>
                                    <p class="text-secondary mb-1">Tenant</p>
                                    <p class="text-muted font-size-sm">Balance: <fmt:formatNumber value = "<%=account.getBalance()%>" type = "number"/> VND</p>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-8">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%=profile.getFullName()%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%=profile.getEmail()%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Phone</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%=profile.getPhone()%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Date Of Birth</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%=profile.getDOB()%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Gender</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <%if (profile.getGender() == 1) {%>
                                    Male
                                    <%}%>
                                    <%if (profile.getGender() == 0) {%>
                                    Female
                                    <%}%>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-12">
                                    <a class="btn btn-info " href="profile?go=edit">Edit</a>
                                    <a class="btn btn-info " href="change-password">Change Password</a>
                                    <c:if test="${roleid eq '2'}">
                                        <a class="btn btn-info " href="contract-tenant">View Contract</a>
                                        <a class="btn btn-info " href="request-tenant">View Request</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row gutters-sm">


                    </div>
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
    <!-- <script src='assets/vendors/switcher/switcher.js'></script> -->
    <!-- Revolution JavaScripts Files -->
    <script src="assets/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="assets/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Slider revolution 5.0 Extensions  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="assets/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script>
        jQuery(document).ready(function () {
            var ttrevapi;
            var tpj = jQuery;
            if (tpj("#rev_slider_486_1").revolution == undefined) {
                revslider_showDoubleJqueryError("#rev_slider_486_1");
            } else {
                ttrevapi = tpj("#rev_slider_486_1").show().revolution({
                    sliderType: "standard",
                    jsFileLocation: "assets/vendors/revolution/js/",
                    sliderLayout: "fullwidth",
                    dottedOverlay: "none",
                    delay: 9000,
                    navigation: {
                        keyboardNavigation: "on",
                        keyboard_direction: "horizontal",
                        mouseScrollNavigation: "off",
                        mouseScrollReverse: "default",
                        onHoverStop: "on",
                        touch: {
                            touchenabled: "on",
                            swipe_threshold: 75,
                            swipe_min_touches: 1,
                            swipe_direction: "horizontal",
                            drag_block_vertical: false
                        }
                        ,
                        arrows: {
                            style: "uranus",
                            enable: true,
                            hide_onmobile: false,
                            hide_onleave: false,
                            tmp: '',
                            left: {
                                h_align: "left",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            },
                            right: {
                                h_align: "right",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            }
                        },

                    },
                    viewPort: {
                        enable: true,
                        outof: "pause",
                        visible_area: "80%",
                        presize: false
                    },
                    responsiveLevels: [1240, 1024, 778, 480],
                    visibilityLevels: [1240, 1024, 778, 480],
                    gridwidth: [1240, 1024, 778, 480],
                    gridheight: [768, 600, 600, 600],
                    lazyType: "none",
                    parallax: {
                        type: "scroll",
                        origo: "enterpoint",
                        speed: 400,
                        levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 46, 47, 48, 49, 50, 55],
                        type: "scroll",
                    },
                    shadow: 0,
                    spinner: "off",
                    stopLoop: "off",
                    stopAfterLoops: -1,
                    stopAtSlide: -1,
                    shuffle: "off",
                    autoHeight: "off",
                    hideThumbsOnMobile: "off",
                    hideSliderAtLimit: 0,
                    hideCaptionAtLimit: 0,
                    hideAllCaptionAtLilmit: 0,
                    debugMode: false,
                    fallbacks: {
                        simplifyAll: "off",
                        nextSlideOnWindowFocus: "off",
                        disableFocusListener: false,
                    }
                });
            }
        });
    </script>

</body>
</html>