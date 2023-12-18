<%-- 
    Document   : createAds
    Created on : Sep 25, 2023, 5:51:12 AM
    Author     : DELL i7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="Create Advertisement" />

        <!-- OG -->

        <meta
            property="og:title"
            content="Advertisement" />
        <meta
            property="og:description"
            content="Advertisement" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Advertisement</title>

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
                        <h4 class="breadcrumb-title">Advertisement</h4>
                        <ul class="db-breadcrumb-list">
                            <li>
                                <a href="#"><i class="fa fa-home"></i>Home</a>
                            </li>
                            <li>Create Advertisement</li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title">
                                    <h4>Create Advertisement</h4>
                                </div>
                                <div class="widget-inner">
                                    <table height="50%" width ="50%" border="1">
                                        <thead>
                                            <tr>
                                                <th>HouseID</th>
                                                <th>HouseName</th>
                                                <th>Address</th>
                                                <th>Image</th>
                                                <th>Status</th>
                                                <th>Time For Ads</th>
                                                <th>Create Ads</th>
                                            </tr>
                                        </thead>

                                    <c:forEach items="${listHouse}" var = "lh">       
                                        <form action="CreateAdsLandLord?houseID=${lh.houseID}" method="post">
                                            <tbody>
                                                <tr>
                                                    <td>${lh.houseID}</td>
                                                    <td>${lh.name}</td>
                                                    <td>${lh.address}</td>
                                                    <td><img src="${lh.previewImage.imagePath}" alt="error" style="width: 100px"></td>
                                                    <td>${lh.status}</td>
                                                    <td>
                                                        <select id="time" name="time">
                                                            <option value="0" >Time</option>
                                                            <option value="1" >1 Week</option>
                                                            <option value="2" >1 Month</option>
                                                            <option value="3" >3 Month</option>
                                                        </select>
                                                    </td>
                                                    <td><input type="submit" value="Create"></td>
                                                </tr>

                                            </tbody>
                                        </form>

                                    </c:forEach> 
                                    <div class="form-outline mb-4">
                                        <font color="red">${requestScope.error}</font>
                                    </div>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<div class="ttr-overlay"></div>
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
