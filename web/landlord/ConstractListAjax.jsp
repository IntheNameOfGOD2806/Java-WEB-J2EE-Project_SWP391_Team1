<%-- 
    Document   : Constract
    Created on : Sep 25, 2023, 3:12:48 AM
    Author     : adm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">    <head>
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
        <title>Your Contracts</title>

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
        <!--<main class="ttr-wrapper">-->
        <div class="container-fluid">
            <div class="db-breadcrumb">
                <h4 class="breadcrumb-title">Contract</h4>
                <ul class="db-breadcrumb-list">
                    <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
                    <li>Contract</li>
                </ul>
            </div>	
            <div class="row">
                <!-- Your Profile Views Chart -->
                <div class="col-lg-12 m-b30">
                    <div class="widget-box" style="padding-left: 20px">
                        <div class="wc-title">
                            <h3>Danh sách hợp đồng</h3>
                        </div>
                        <div>
                            <c:if test="${notification eq 'deleted'}">
                                <h5 style="color: red">Contract deleted</h5>
                            </c:if>
                            <c:if test="${notification eq 'deActive'}">
                                <h5 style="color: red">Contract disabled</h5>
                            </c:if>
                        </div>
                        <c:if test="${isContractListEmpty}">
                            <h5 style="color: red">Danh sách hợp đồng của bạn đang trống.</h5>
                        </c:if>
                        <c:forEach items="${listCon}" var="contract">
                            <div class="card-courses-list admin-review">
                                <div class="card-courses-full-dec">
                                    <div class="card-courses-title">
                                        <h4>Nhà: ${contract.room.house.name} | Phòng số ${contract.roomID}</h4>
                                    </div>
                                    <div class="card-courses-list-bx">
                                        <ul class="card-courses-view">
                                            <li class="card-courses-user">
                                                <div class="card-courses-user-pic">
                                                    <img src="${contract.profile.photo}" alt="user's avatar"/>
                                                </div>
                                                <div class="card-courses-user-info">
                                                    <h5>Người thuê: ${contract.profile.fullName}</h5>
                                                </div>
                                            </li>
                                            <li class="card-courses-categories">
                                                <h5>Start Date: ${contract.startDate}</h5>
                                            </li>
                                            <li class="card-courses-categories">
                                                <%--<fmt:formatDate value="${c.endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />--%>
                                                <h5>Ngày kết thúc: ${contract.endDate}</h5>
                                            </li>
                                            <li class="card-courses-price">
                                                <c:if test="${contract.status eq 'true'}">
                                                    <h5 class="text-primary">Trạng thái: Còn hiệu lực</h5>
                                                </c:if>
                                                <c:if test="${contract.status eq 'false'}">
                                                    <h5 class="text-primary">Trạng thái: Đã hết hạn</h5>
                                                </c:if>
                                            </li>
                                            <li class="card-courses-price">
                                                <h5 class="btn button-sm green radius-xl">
                                                    Giá phòng: <fmt:formatNumber value = "${contract.room.price}" type = "number"/> VND/tháng
                                                </h5>
                                            </li>
                                            <li class="card-courses-price">
                                                <h5>
                                                    <a onclick="loadContractDelete(${contract.constractID})"  class="btn red outline radius-xl ">Xóa hợp đồng</a>
                                                    <c:if test="${contract.status eq 'true'}">
                                                        <a onclick="confirmEndContract(${contract.constractID})" class="btn red outline radius-xl">Kết thúc hợp đồng</a>
                                                    </c:if>
                                                </h5>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Your Profile Views Chart END-->
            </div>
        </div>
        <!--</main>-->

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

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/bookmark.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
</html>