<%-- 
    Document   : createAds
    Created on : Sep 25, 2023, 5:51:12 AM
    Author     : DELL i7
--%>

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
            href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Advertisement</title>

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
                                <form action="CreateAds" method="post" >

                                    <div class="form-outline mb-4">
                                        <label class="form-label">HouseID : </label>
                                        <input type="number" id="houseID" name="houseID" value="${requestScope.HouseID}" class="form-control form-control-lg"required>
                                    </div><!-- comment -->

                                    <div class="form-outline mb-4">
                                        <label class="form-label">AdvertisementFee : </label>
                                        <input type="number" id="adsFee" name="adsFee" value="${requestScope.AdsFee}" class="form-control form-control-lg"required>
                                    </div><!-- comment -->

                                    <div class="form-outline mb-4">
                                        <label class="form-label">StartDate : </label>
                                        <input type="date" id="startDate" name="startDate" value="${requestScope.StartDate}" class="form-control form-control-lg"required>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label">EndDate : </label>
                                        <input type="date" id="endDate" name="endDate" value="${requestScope.EndDate}" class="form-control form-control-lg"required>
                                    </div><!-- comment -->
                                    <div class="form-outline mb-4">
                                        <font color="red">${requestScope.error}</font>
                                    </div>
                                    
                                    <input type="submit" value="Save">
                                </form>
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
<script src="marketing/assets/vendors/scroll/scrollbar.min.js"></script>
<script src="marketing/assets/js/functions.js"></script>
<script src="marketing/assets/vendors/chart/chart.min.js"></script>
<script src="marketing/assets/js/admin.js"></script>
</body>
</html>
