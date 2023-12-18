<%-- 
    Document   : ReplyFeedback
    Created on : Oct 7, 2023, 9:57:56 AM
    Author     : huyht
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO, dal.HouseDAO" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from educhamp.themetrades.com/demo/landlord/feedback.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="View Feedback" />

        <!-- OG -->

        <meta
            property="og:title"
            content="Feedback" />
        <meta
            property="og:description"
            content="Feedback" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="#" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Feedback</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.min.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/assets.css" />
        <link
            rel="stylesheet"
            type="text/css"
            href="landlord/assets/vendors/calendar/fullcalendar.css" />

        <!-- TYPOGRAPHY ============================================= -->
        <link
            rel="stylesheet"
            type="text/css"
            href="landlord/assets/css/typography.css" />

        <!-- SHORTCODES ============================================= -->
        <link
            rel="stylesheet"
            type="text/css"
            href="landlord/assets/css/shortcodes/shortcodes.css" />

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/style.css" />
        <link
            rel="stylesheet"
            type="text/css"
            href="landlord/assets/css/dashboard.css" />
        <link
            class="skin"
            rel="stylesheet"
            type="text/css"
            href="landlord/assets/css/color/color-1.css" />
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!--Main container start -->
            <main class="ttr-wrapper">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title">Feedback</h4>
                        <ul class="db-breadcrumb-list">
                            <li>
                                <a href="#"><i class="fa fa-home"></i>Home</a>
                            </li>
                            <li>Reply Feedback</li>
                        </ul>
                    </div>
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title">
                                    <ul class="card-courses-view">
                                        <li><h4>Feedback</h4></li>
                                    </ul>
                                </div>
                                <div class="widget-inner">
                                    <!-- loop feedback data -->
                                    <div class="card-courses-list admin-review">
                                        <div class="card-courses-full-dec">
                                        <%
                                            FeedbackDAO feedbackDAO1 = new FeedbackDAO();
                                                    HouseDAO houseDAO = new HouseDAO();
                                        %>
                                        <%
                                            Feedback f = (Feedback)request.getAttribute("feedback");
                                        %>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li
                                                    class="card-courses-categories">
                                                    <h5>ID</h5>
                                                    <h4><%=f.getFeedbackId()%></h4>
                                                </li>
                                                <!-- co the them link nha vao day -->
                                                <li
                                                    class="card-courses-categories">
                                                    <h5>House</h5>
                                                    <a href="#">
                                                    <h4><%=houseDAO.getHouseByHouseId(f.getHouseId()).getName()%></h4>
                                                    </a>
                                                </li>
                                                <li class="card-courses-user">
                                                    <div
                                                        class="card-courses-user-pic">
                                                        <a href="#">
                                                        <img
                                                            src="<%=feedbackDAO1.getProfileByAccountId(f.getAccountId()).getPhoto()%>"
                                                            alt="" />
                                                        </a>
                                                    </div>
                                                    <div
                                                        class="card-courses-user-info">
                                                        <h5></h5>
                                                        <h4>
                                                            <%=feedbackDAO1.getProfileByAccountId(f.getAccountId()).getFullName()%>
                                                        </h4>
                                                    </div>
                                                </li>
                                                <li
                                                    class="card-courses-categories">
                                                    <h5>Date</h5>
                                                    <h4><%=f.getCreateDate()%></h4>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <p>
                                                    <%=f.getDescription()%>
                                                </p>
                                            </div>
                                            <div class="col-md-12">
                                                <form action="landlord-feedback?go=reply" method="POST">
                                                    <input type="hidden" name="fId" value="<%=f.getFeedbackId()%>">
                                                    <input type="hidden" name="hId" value="<%=f.getHouseId()%>">
                                                    <div class="modal-header">
                                                        <h5
                                                            class="modal-title"
                                                            id="exampleModalLabel">
                                                            Reply to feedback
                                                        </h5>
                                                        
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="text" class="form-control" name="reply_feedback" placeholder="Type text"/>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button
                                                            type="submit"
                                                            name="submit"
                                                            class="btn mr-auto">
                                                            Reply
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>


        <!-- External JavaScripts -->
        <script src="landlord/assets/js/jquery.min.js"></script>
        <script src="landlord/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="landlord/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="landlord/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="landlord/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="landlord/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="landlord/assets/vendors/counter/waypoints-min.js"></script>
        <script src="landlord/assets/vendors/counter/counterup.min.js"></script>
        <script src="landlord/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="landlord/assets/vendors/masonry/masonry.js"></script>
        <script src="landlord/assets/vendors/masonry/filter.js"></script>
        <script src="landlord/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="landlord/assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="landlord/assets/js/functions.js"></script>
        <script src="landlord/assets/vendors/chart/chart.min.js"></script>
        <script src="landlord/assets/js/admin.js"></script>
    </body>

</html>
