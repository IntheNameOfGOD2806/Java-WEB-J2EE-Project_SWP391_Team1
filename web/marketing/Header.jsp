<%-- 
    Document   : ViewFeedback
    Created on : Sep 25, 2023, 5:15:22 AM
    Author     : huyht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="java.util.List, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO" %>

<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from educhamp.themetrades.com/demo/marketing/feedback.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="" />

        <!-- OG -->

        <meta
            property="og:title"
            content="" />
        <meta
            property="og:description"
            content="" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="#" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title></title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.min.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/assets.css" />
        <link
            rel="stylesheet"
            type="text/css"
            href="marketing/assets/vendors/calendar/fullcalendar.css" />

        <!-- TYPOGRAPHY ============================================= -->
        <link
            rel="stylesheet"
            type="text/css"
            href="marketing/assets/css/typography.css" />

        <!-- SHORTCODES ============================================= -->
        <link
            rel="stylesheet"
            type="text/css"
            href="marketing/assets/css/shortcodes/shortcodes.css" />

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/style.css" />
        <link
            rel="stylesheet"
            type="text/css"
            href="marketing/assets/css/dashboard.css" />
        <link
            class="skin"
            rel="stylesheet"
            type="text/css"
            href="marketing/assets/css/color/color-1.css" />
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <!-- header start -->
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <!--sidebar menu toggler start -->
                <div class="ttr-toggle-sidebar ttr-material-button">
                    <i class="ti-close ttr-close-icon"></i>
                    <i class="ti-menu ttr-open-icon"></i>
                </div>
                <!--sidebar menu toggler end -->
                <!--logo start -->
                <div class="ttr-logo-box">
                    <div>
                        <a href="#" class="ttr-logo">
                            <img
                                alt=""
                                class="ttr-logo-mobile"
                                src="marketing/assets/images/logo_real_white.png"
                                width="30"
                                height="30" />
                            <img
                                alt=""
                                class="ttr-logo-desktop"
                                src="marketing/assets/images/logo_real_white.png"
                                width="160"
                                height="27" />
                        </a>
                    </div>
                </div>
                <!--logo end -->
                <div class="ttr-header-menu">
                    <!-- header left menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a
                                href="home"
                                class="ttr-material-button ttr-submenu-toggle"
                                >HOME</a
                            >
                        </li>
                                                <li>
                            <a
                                href="#"
                                class="ttr-material-button ttr-submenu-toggle"
                                >QUICK MENU <i class="fa fa-angle-down"></i
                                ></a>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li>
                                        <a href="MKTDashBoard"
                                           >Dashboard</a
                                        >
                                    </li>
                                    <li>
                                        <a href="bloglist">Blog</a>
                                    </li>
                                    <li>
                                        <a href="ListAds"
                                           >Advertisement</a
                                        >
                                    </li>
                                    <li>
                                        <a href="view-feedback"
                                           >Feedback</a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!-- header left menu end -->
                </div>
                <div class="ttr-header-right ttr-with-seperator">
                    <!-- header right menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <c:set var = "accountId" value = "${sessionScope.accountid}"/>
                            <% 
                                int aId = (int)pageContext.getAttribute("accountId");     
                            %>
                            <%
                                FeedbackDAO feedbackDAO2 = new FeedbackDAO();
                            %>
                            <a
                                href="#"
                                class="ttr-material-button ttr-submenu-toggle"
                                ><span class="ttr-user-avatar"
                                   ><img
                                        alt=""
                                        src="<%=feedbackDAO2.getProfileByAccountId(aId).getPhoto()%>"
                                        width="32"
                                        height="32" /></span
                                ></a>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li>
                                        <a href="profile"
                                           >My profile</a
                                        >
                                    </li>
                                    <li><a href="/logout">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!-- header right menu end -->
                </div>
                <!--header search panel start -->
                <!--header search panel end -->
            </div>
        </header>
        <!-- header end -->
        <jsp:include page="Menu.jsp"></jsp:include>
        <div class="ttr-overlay"></div>
        <!-- External JavaScripts -->
        <script src='marketing/assets/vendors/calendar/fullcalendar.js'></script>
        <script>
            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    navLinks: true // can click day/week names to navigate views
                });
            });
        </script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/marketing/review.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
