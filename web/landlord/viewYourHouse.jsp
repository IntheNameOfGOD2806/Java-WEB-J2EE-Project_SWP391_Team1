<%-- 
    Document   : viewYourHouse
    Created on : Oct 3, 2023, 11:22:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO, dal.HouseDAO" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from educhamp.themetrades.com/demo/admin/feedback.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
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
        <title>View House</title>

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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



    </head>
    <%
            FeedbackDAO feedbackDAO1 = new FeedbackDAO();
                    HouseDAO houseDAO = new HouseDAO();

    %>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!--Main container start -->

            <main class="ttr-wrapper">
                <div id="houseContent">
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
                                        <h4>Your Houses</h4>
                                    </div>
                                    <!--<a href="createhousetest?accountid=${sessionScope.accountid}" class="btn red radius-x3 outline">Create House</a>-->
                                <a onclick="loadHousePage()"class="btn red radius-x3 outline">Create House</a>


                                <c:forEach var="house" items="${requestScope.listHouse}">
                                    <div class="widget-inner">
                                        <div class="card-courses-list admin-courses">
                                            <div class="card-courses-media">
                                                <a href="viewhouse?houseId=${house.getHouseID()}">
                                                    <img src="${house.getPreviewImage().getImagePath()}" alt=""/>
                                                </a>
                                            </div>
                                            <div class="card-courses-full-dec">
                                                <div class="card-courses-title">
                                                    <h4> ${house.name}</h4>
                                                </div>
                                                <div class="card-courses-list-bx">
                                                    <ul class="card-courses-view">
                                                        <li class="card-courses-user">
                                                            <div class="card-courses-user-pic">
                                                                <img src="${requestScope.profile.getPhoto()}" alt=""/>
                                                            </div>
                                                            <div class="card-courses-user-info">
                                                                <h5>LandLord</h5>
                                                                <h4>${requestScope.profile.getFullName()}</h4>
                                                            </div>
                                                        </li>
                                                        <li class="card-courses-categories">
                                                            <h5>City</h5>
                                                            <h4>${house.city}</h4>
                                                        </li>
                                                        <li class="card-courses-categories">
                                                            <h5>Address</h5>
                                                            <h4 class="text-primary">${house.address}</h4>
                                                        </li>

                                                        <li class="card-courses-stats">
                                                            <a href="#" class="btn button-sm green radius-xl">${house.getStatus()}</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                                <div class="row card-courses-dec">
                                                    <div class="col-md-12">
                                                        <h6 class="m-b10">House Description</h6>
                                                        <p> ${house. getDescription()} </p>	
                                                    </div>
                                                    <div class="col-md-12">
                                                        <a id="editbox" onclick="edithouse(${house.getHouseID()})"   class="btn green radius-xl outline">Edit House</a>

                                                        <a onclick="loadroom(${house.getHouseID()})"  class="btn green radius-xl outline">View Room</a>
                                                        <a onclick="createroom(${house.getHouseID()})"  class="btn green radius-xl outline">Create Room</a>
                                                                                                              <a onclick="confirmDelete(${house.getHouseID()})" class="btn red outline radius-xl">Delete House</a>


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
            </div>


        </main>


        <div class="ttr-overlay"></div>

        <!-- External JavaScripts -->
        <script>
            function confirmDelete(houseID) {
                if (confirm("This Action will erase all your data,continue?")) {
                    // If the user confirms, redirect to the delete URL
                    window.location.href = "deletehouse?houseid=" + houseID;
                }
            }

            var editboxVisible = false; // Variable to track the editbox visibility

            function loadEditBox() {
                // Check the current visibility state and toggle it
                if (editboxVisible) {
                    document.getElementById('editbox').style.display = 'none';
                } else {
                    document.getElementById('editbox').style.display = 'block';
                }

                // Update the visibility state
                editboxVisible = !editboxVisible;
            }
        </script>


        <script>

            function loadHousePage() {
                $.ajax({
                    url: "/landlord/simpleCreateHouse.jsp",
                    type: "get", //send it through get method

                    success: function (response) {
                        var ct = document.getElementById('houseContent');
                        ct.innerHTML = response;
                        //Do Something
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log('error');
                    }
                });
            }
            //
            function loadHousePage2(accountid) {
                $.ajax({
                    url: "/viewyourhousesAjax?accountId=" + accountid + "",
                    type: "get", //send it through get method

                    success: function (response) {
                        var ct = document.getElementById('houseContent');
                        ct.innerHTML = response;
                        //Do Something
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log('error');
                    }
                });
            }</script>


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