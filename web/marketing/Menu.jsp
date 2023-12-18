<%-- 
    Document   : ViewFeedback
    Created on : Sep 25, 2023, 5:15:22 AM
    Author     : huyht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="java.util.List, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector" %>

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
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->

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
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"
                       ><img
                            alt=""
                            src="marketing/assets/images/logo_real.png"
                            width="122"
                            height="27"
                            /></a>
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul>
                        <li>
                            <a href="MKTDashBoard" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-home"></i
                                    ></span>
                                <span class="ttr-label">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-email"></i
                                    ></span>
                                <span class="ttr-label">Manage Blog</span>
                                <span class="ttr-arrow-icon"
                                      ><i class="fa fa-angle-down"></i
                                    ></span>
                            </a>
                            <ul>
                                <li>
                                    <a
                                        href="bloglist"
                                        class="ttr-material-button"
                                        ><span class="ttr-label"
                                           >Blog List</span
                                        ></a
                                    >
                                </li>
                                <li>
                                    <a
                                        href="PostBlog"
                                        class="ttr-material-button"
                                        ><span class="ttr-label"
                                           >Add Blog</span
                                        ></a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-calendar"></i
                                    ></span>
                                <span class="ttr-label">Manage Advertisement</span>
                                <span class="ttr-arrow-icon"
                                      ><i class="fa fa-angle-down"></i
                                    ></span>
                            </a>
                            <ul>
                                <li>
                                    <a
                                        href="ListAds"
                                        class="ttr-material-button"
                                        ><span class="ttr-label"
                                           >View List Ads</span
                                        ></a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="view-feedback" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-comments"></i
                                    ></span>
                                <span class="ttr-label">Feedback</span>
                            </a>
                        </li>
                        <li class="ttr-seperate"></li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->
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
</html>
