<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
    Document   : index1
    Created on : Oct 4, 2023, 9:30:19 PM
    Author     : huyht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>


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
        <meta name="description" content="Muonnha.vn" />

        <!-- OG -->
        <meta property="og:title" content="Muonnha.vn" />
        <meta property="og:description" content="Muonnha.vn" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Muonnha</title>

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

        <!-- REVOLUTION SLIDER CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/navigation.css">
        <!-- REVOLUTION SLIDER END -->
    </head>
    <%
        ResultSet resultSetImage = (ResultSet)request.getAttribute("resultSetImage");
        ResultSet resultSetImage2 = (ResultSet)request.getAttribute("resultSetImage2");
        HouseDAO houseDAO = new HouseDAO();
    %>
    <body id="bg">
        <div class="page-wraper">
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
            <!-- Header Top END ==== -->
            <div id="loading-icon-bx"></div>

            <!-- Content -->
            <div class="page-content bg-white">
                <!-- Main Slider -->
                <div class="rev-slider">
                    <div id="rev_slider_486_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="news-gallery36" data-source="gallery" style="margin:0px auto;background-color:#ffffff;padding:0px;margin-top:0px;margin-bottom:0px;">
                        <!-- START REVOLUTION SLIDER 5.3.0.2 fullwidth mode -->
                        <div id="rev_slider_486_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.3.0.2">
                            <ul>	<!-- SLIDE  -->
                                <% while(resultSetImage.next()) { %>
                                <li data-index="rs-100"
                                    data-transition="parallaxvertical"
                                    data-slotamount="default"
                                    data-hideafterloop="0"
                                    data-hideslideonmobile="off"
                                    data-easein="default"
                                    data-easeout="default"
                                    data-masterspeed="default"
                                    data-thumb=""
                                    data-rotate="0"
                                    data-fstransition="fade"
                                    data-fsmasterspeed="1500"
                                    data-fsslotamount="7"
                                    data-saveperformance="off"
                                    data-title=""
                                    data-param1="" data-param2=""
                                    data-param3="" data-param4=""
                                    data-param5="" data-param6=""
                                    data-param7="" data-param8=""
                                    data-param9="" data-param10=""
                                    data-description="Science says that Women are generally happier">
                                    <!-- MAIN IMAGE -->
                                    <img src="<%=resultSetImage.getString(1)%>" alt=""
                                         data-bgposition="center center"
                                         data-bgfit="cover"
                                         data-bgrepeat="no-repeat"
                                         data-bgparallax="10"
                                         class="rev-slidebg"
                                         data-no-retina />

                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption tp-shape tp-shapewrapper "
                                         id="slide-100-layer-1"
                                         data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                         data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']"
                                         data-width="full"
                                         data-height="full"
                                         data-whitespace="nowrap"
                                         data-type="shape"
                                         data-basealign="slide"
                                         data-responsive_offset="off"
                                         data-responsive="off"
                                         data-frames='[{"from":"opacity:0;","speed":1,"to":"o:1;","delay":0,"ease":"Power4.easeOut"},{"delay":"wait","speed":1,"to":"opacity:0;","ease":"Power4.easeOut"}]'
                                         data-textAlign="['left','left','left','left']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 5;border-color:rgba(0, 0, 0, 0);border-width:0px;"> </div>
                                </li>
                                <%}%>
                                <!-- SLIDE  -->
                            </ul>
                        </div><!-- END REVOLUTION SLIDER -->
                    </div>
                </div>
                <!-- Main Slider -->
                <div class="content-block">

                    <!-- Popular Courses -->
                    <div class="section-area section-sp2 popular-courses-bx">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 heading-bx left">
                                    <h2 class="title-head">Advertised <span>Houses</span></h2>
                                    <!--                                    <p>Sponsors</p>-->
                                </div>
                            </div>
                            <div class="row">
                                <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                    <%
                                         while(resultSetImage2.next()) { %>
                                    <div class="item">
                                        <div class="cours-bx">
                                            <%int houseId = resultSetImage2.getInt(4);%>
                                            <div class="action-box">
                                                <img src="<%=resultSetImage2.getString(1)%>" alt="">
                                                <a href="viewhouse?houseId=<%=houseId%>" class="btn">View More</a>
                                            </div>
                                            <div class="info-bx text-center">
                                                <h5><a href="viewhouse?houseId=<%=houseId%>"><%=resultSetImage2.getString(2)%></a></h5>
                                                <span><%=resultSetImage2.getString(3)%></span>
                                            </div>
                                            <div class="cours-more-info">
                                                <!--                                                <div class="review col-4"><h5>From</h5></div>-->
                                                <div class="price col-11">
                                                    <c:set var = "balance" value = "<%=houseDAO.getLowestPriceByHouseId(houseId)%>" />
                                                    <h5> From <fmt:formatNumber value = "${balance}" type = "number"/> VND</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Popular Courses END -->

                    <!-- Form -->
                    <div class="section-area section-sp1 ovpr-dark bg-fix online-cours" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center text-white">
                                    <h2>Beautiful House To Rent</h2>
                                    <h5></h5>
<!--                                    <form class="cours-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="What do you want to learn today?	">
                                            <div class="input-group-append">
                                                <button class="btn" type="submit">Search</button>
                                            </div>
                                        </div>
                                    </form>-->
                                </div>
                            </div>
                            <div class="mw800 m-auto">
                                <div class="row">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-user"></i><span class="counter">${requestScope.numOfUser}</span></h3>
                                            </div>
                                            <span class="cours-search-text">${requestScope.numOfUser} users</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-home"></i><span class="counter">${requestScope.numOfRoom}</span></h3>
                                            </div>
                                            <span class="cours-search-text">${requestScope.numOfRoom} Room</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-layers"></i><span class="counter">${requestScope.numOfHouse}</span></h3>
                                            </div>
                                            <span class="cours-search-text">Apartment</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Form END -->

                    <!-- Footer END ==== -->
                    <button class="back-to-top fa fa-chevron-up" ></button>
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


