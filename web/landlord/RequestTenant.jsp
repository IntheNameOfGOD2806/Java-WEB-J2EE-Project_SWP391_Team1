<%-- 
    Document   : RequestTenant
    Created on : Nov 4, 2023, 12:39:57 AM
    Author     : adm
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
        <!-- Mirrored from educhamp.themetrades.com/demo/landlord/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
        <head>
            <!-- META ============================================= -->
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="keywords" content="" />
            <meta name="author" content="" />
            <meta name="robots" content="" />

            <!-- DESCRIPTION -->
            <meta name="description" content="Your Request" />

            <!-- OG -->
            <meta property="og:title" content="Your Request" />
            <meta
                property="og:description"
                content="Your Request"
                />
            <meta property="og:image" content="" />
            <meta name="format-detection" content="telephone=no" />

            <!-- FAVICONS ICON ============================================= -->
            <link rel="icon" href="../error-404.html" type="image/x-icon" />
            <link
                rel="shortcut icon"
                type="image/x-icon"
                href="landlord/assets/images/favicon.png"
                />

            <!-- PAGE TITLE HERE ============================================= -->
            <title>Your Request</title>

            <!-- MOBILE SPECIFIC ============================================= -->
            <meta name="viewport" content="width=device-width, initial-scale=1" />

            <!--[if lt IE 9]>
              <script src="landlord/assets/js/html5shiv.min.js"></script>
              <script src="landlord/assets/js/respond.min.js"></script>
            <![endif]-->

            <!-- All PLUGINS CSS ============================================= -->
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/assets.css"
                />
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/vendors/calendar/fullcalendar.css"
                />

            <!-- TYPOGRAPHY ============================================= -->
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/typography.css"
                />

            <!-- SHORTCODES ============================================= -->
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/shortcodes/shortcodes.css"
                />

            <!-- STYLESHEETS ============================================= -->
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/style.css"
                />
            <link
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/dashboard.css"
                />
            <link
                class="skin"
                rel="stylesheet"
                type="text/css"
                href="landlord/assets/css/color/color-1.css"
                />
        </head>
        <jsp:include page="/header.jsp"></jsp:include>
            <body class="ttr-opened-sidebar ttr-pinned-sidebar">
                <!--Main container start -->
                <main class="ttr-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Your Profile Views Chart -->
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="wc-title" style="padding-top: 50px">
                                        <h3>Danh sách yêu cầu của bạn</h3>
                                    </div>
                                <c:if test="${isRequestListEmpty}">
                                    <h5 style="color: red">
                                        Danh sách yêu cầu của bạn đang trống.
                                    </h5>
                                </c:if>
                                <c:forEach items="${listR}" var="r">
                                    <div class="card-courses-full-dec" style="padding: 20px">
                                        <div class="card-courses-title">
                                            <h4>${r.requestDate}</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img
                                                            src="${r.profile.photo}"
                                                            alt="user's avatar"
                                                            style="width: 150px"
                                                            />
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>Nhà: ${r.room.house.name}</h5>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>Phòng số ${r.roomID}</h5>
                                                </li>
                                                <li class="card-courses-price">
                                                    <h5 class="btn button-sm green radius-xl">
                                                        Giá phòng: <fmt:formatNumber value = "${r.room.price}" type = "number"/> VND/tháng
                                                    </h5>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
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
            <script src="landlord/assets/vendors/scroll/scrollbar.min.js"></script>
            <script src="landlord/assets/js/functions.js"></script>
            <script src="landlord/assets/vendors/chart/chart.min.js"></script>
            <script src="landlord/assets/js/admin.js"></script>
        </body>

        <!-- Mirrored from educhamp.themetrades.com/demo/landlord/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
    </html>
