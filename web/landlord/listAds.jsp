<%-- 
    Document   : viewAds
    Created on : Sep 25, 2023, 5:50:43 AM
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
        <meta name="description" content="List Advertisement" />

        <!-- OG -->

        <meta
            property="og:title"
            content="ListAds" />
        <meta
            property="og:description"
            content="Adevertisement" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>List Advertisement</title>

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
                            <li>List Advertisement</li>
                        </ul>
                    </div>
                    <div class="row">

                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title">
                                    <h4>List Advertisement</h4>
                                </div>
                                
                                <div class="widget-inner">
                                    <table height="50%" width ="50%" border="1">
                                        <thead>
                                            <tr>
                                                <th>AdsID</th>
                                                <th>HouseID</th>
                                                <th>AdsFee</th>
                                                <th>StartDate</th>
                                                <th>EndDate</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>

                                    <c:forEach items="${ListAds}" var = "la">       
                                        <tbody>
                                            <tr>
                                                <td>${la.adsId}</td>
                                                <td>${la.houseId}</td>
                                                <td>${la.adsFee}</td>
                                                <td>${la.startDate}</td>
                                                <td>${la.endDate}</td>
                                                <c:if test="${la.status == 1}" >
                                                    <td>Active</td>
                                                </c:if>
                                                <c:if test="${la.status != 1}" >
                                                    <td>Inactive</td>
                                                </c:if>
                                            </tr>
                                        </tbody>
                                    </c:forEach> 
                                </table>
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
