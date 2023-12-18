<%-- 
    Document   : Request
    Created on : Sep 24, 2023, 6:17:43 PM
    Author     : adm
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Your Request</title>

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
        <%--<jsp:include page="Header.jsp"></jsp:include>--%>
        <!--Main container start -->

        <div class="container-fluid">
            <div class="db-breadcrumb">
                <h4 class="breadcrumb-title">Request</h4>
                <ul class="db-breadcrumb-list">
                    <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
                    <li>Request</li>
                </ul>
            </div>	
            <div class="row">
                <!-- Your Profile Views Chart -->
                <div class="col-lg-12 m-b30">
                    <div class="widget-box">
                        <div class="wc-title">
                            <h3>Danh sách yêu cầu</h3>
                        </div>
                        <div>
                            <c:if test="${notification eq 'agree'}">
                                <h5 style="color: green">Request accepted</h5>
                            </c:if>
                            <c:if test="${notification eq 'decline'}">
                                <h5 style="color: red">Request rejected</h5>
                            </c:if>
                        </div>
                        <c:if test="${isRequestListEmpty}">
                            <h5 style="color: red">Danh sách yêu cầu của bạn đang trống.</h5>
                        </c:if>
                        <c:forEach items="${listR}" var="r">
                            <div class="card-courses-list admin-review">
                                <c:if test="${sessionScope.accountid == r.getRoom().getHouse().getAccountID()}">



                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4>${r.getRequestDate()}</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="${r.profile.photo}" alt="user's avatar" style="width: 150px"/>
                                                    </div>
                                                    <div class="card-courses-user-info">
                                                        <h5>Người thuê: ${r.profile.fullName}</h5>
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>Số điện thoại: ${r.profile.phone}</h5>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>Nhà: ${r.room.house.name}</h5>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>Phòng số ${r.roomID}</h5>
                                                </li>
                                                <li class="card-courses-price">
                                                    <c:if test="${r.room.status eq 'Hired'}">
                                                        <div style="display: flex">
                                                            <h5 class="text-primary">Trạng thái phòng:</h5>
                                                            <h5 class="text-primary" style="color: red">Đã có người thuê</h5>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${r.room.status eq 'Active'}">
                                                        <div style="display: flex">
                                                            <h5 class="text-primary">Trạng thái phòng:</h5>
                                                            <h5 class="text-primary" style="color: green">Chưa có người thuê</h5>
                                                        </div>
                                                    </c:if>
                                                </li>
                                                <li class="card-courses-price">
                                                    <h5 class="btn button-sm green radius-xl">
                                                        Giá phòng: <fmt:formatNumber value = "${r.room.price}" type = "number"/> VND/tháng
                                                    </h5>
                                                </li>
                                                <li class="card-courses-price">
                                                    <c:if test="${r.room.status eq 'Active'}">
                                                        <a  onclick="confirmRequest('approve', ${r.requestID})"  class="btn green radius-xl outline">Đồng ý</a>
                                                    </c:if>
                                                    <a  onclick="confirmRequest('decline', ${r.requestID})"  class="btn red outline radius-xl ">Từ chối</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if>
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
        <script src="landlord/assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="landlord/assets/js/functions.js"></script>
        <script src="landlord/assets/vendors/chart/chart.min.js"></script>
        <script src="landlord/assets/js/admin.js"></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>

