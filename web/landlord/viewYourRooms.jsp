<%-- 
    Document   : viewYourHouse
    Created on : Oct 3, 2023, 11:22:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List, model.Profile,model.Room, jakarta.servlet.http.HttpSession, java.util.Vector, dal.AccountDAO, dal.HouseDAO" %>


<!DOCTYPE html>
<html lang="en">
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
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>View Room</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!--[if lt IE 9]>
            <script src="landlord/assets/js/html5shiv.min.js"></script>
            <script src="landlord/assets/js/respond.min.js"></script>
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

        <!--Main container start -->

        <div class="container-fluid">
            <div class="db-breadcrumb">
                <h4 class="breadcrumb-title">Courses</h4>
                <ul class="db-breadcrumb-list">
                    <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                    <li>Houses</li>
                </ul>
            </div>	
            <div class="row">
                <!-- Your Profile Views Chart -->
                <div class="col-lg-12 m-b30">
                    <div class="widget-box">
                        <div class="wc-title">
                            <h4>Your Rooms</h4>
                        </div>
                        <!--<a href="createroom?houseid=${requestScope.house.getHouseID()}" class="btn red radius-x3 outline">Create Room</a>-->

                        <c:forEach var="room" items="${requestScope.listRoom}">
                                                            

                            
                            <%
                                                   Room r = (Room)pageContext.getAttribute("room");
                                                   
                %>
                <!--<h1>${room.getAccountID()}</h1>-->
                            <div class="widget-inner">
                                <div class="card-courses-list admin-courses">
                                    <div class="card-courses-media">
                                        <a href="#">
                                            <img src="https://img.freepik.com/free-photo/home-icon-front-side-with-white-background_187299-40059.jpg?w=740&t=st=1694864008~exp=1694864608~hmac=6ea3614b4e205480034e02fc6db34958eceb7da781460bef1628b045594b5933" alt=""/>
                                        </a>
                                    </div>
                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4><fmt:formatNumber value = "${room.price}" type = "number"/> VND</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="${requestScope.landlordInfo.getPhoto()}" alt=""/>
                                                    </div>
                                                    <div class="card-courses-user-info">

                                                        <h5>LandLord</h5>
                                                        <h4>${requestScope.landlordInfo.getFullName()}</h4>
                                                        <h5>Tenant</h5>
                                                        <%
                                                            
                                                        AccountDAO ad= new AccountDAO();
                                          Profile profile1=ad.getProfileByProfileId(ad.getProfileIdByAccountId(r.getAccountID()));
                                                       
                                                        %>
                                                        <h4>
                                                           
                                                            <c:if test="<%=profile1!=null%>">
                                                                <%=profile1.getFullName()%>
                                                            </c:if>
                                                           
                                                        </h4>
                                                    </div>
                                                </li>



                                                <li class="card-courses-stats">
                                                    <a href="#" class="btn button-sm green radius-xl">${room.getStatus()}</a>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <h6 class="m-b10">Room Description</h6>
                                                <p> ${room. getDescription()} </p>	
                                            </div>
                                            <div class="col-md-12">
                                                <a onclick="editroom(${room.getRoomID()})" class="btn green radius-xl outline">Edit Room</a>
                                                <a onclick="deleteroomconfirm(${room.getRoomID()})"  class="btn red radius-xl outline">Delete Room</a>


                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </c:forEach>

                    </div>
                </div>
                <!-- Your Profile Views Chart END-->
            </div>
        </div>

        <div class="ttr-overlay"></div>

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
        <script src='landlord/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="landlord/assets/js/functions.js"></script>
        <script src="landlord/assets/vendors/chart/chart.min.js"></script>
        <script src="landlord/assets/js/admin.js"></script>
        <script src='landlord/assets/vendors/switcher/switcher.js'></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>