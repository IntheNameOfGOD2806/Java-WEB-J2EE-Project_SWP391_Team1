<%-- 
    Document   : Request
    Created on : Sep 24, 2023, 6:17:43 PM
    Author     : adm
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <!--Main container start -->
            <main class="ttr-wrapper">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h4 class="breadcrumb-title">Request</h4>
                        <ul class="db-breadcrumb-list">
                            <li><a href="/home"><i class="fa fa-home"></i>Home</a></li>
                            <li>Request</li>
                        </ul>
                    </div>	
                    <div class="row" >
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30" >
                            <div class="widget-box" style="padding: 20px"
                                 >
                                <div class="wc-title">
                                    <h3>Danh sách yêu cầu</h3>
                                </div>
                                <div>
                                <c:if test="${notification eq 'agree'}">
                                    <h5 style="color: green">Request ${getId} accepted</h5>
                                </c:if>
                                <c:if test="${notification eq 'decline'}">
                                    <h5 style="color: red">Request ${getId} rejected</h5>
                                </c:if>
                            </div>
                            <c:if test="${isRequestListEmpty}">
                                <h5 style="color: red">Danh sách yêu cầu của bạn đang trống.</h5>
                            </c:if>
                            <c:forEach items="${listR}" var="r">
                                <div class="card-courses-full-dec">
                                    <div class="card-courses-title">
                                        <h4>${r.requestDate}</h4>
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
                                                <h5 class="text-primary">Trạng thái phòng: ${r.room.status}</h5>
                                            </li>
                                            <li class="card-courses-price">
                                                <h5 class="btn button-sm green radius-xl">Giá phòng: ${r.room.price}VND/tháng</h5>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="row card-courses-dec">
                                        <div class="col-md-12">
                                            <a href="request-list?service=agree&id=${r.requestID}" class="btn green radius-xl outline">Đồng ý</a>
                                            <a href="request-list?service=decline&id=${r.requestID}" class="btn red outline radius-xl ">Từ chối</a>
                                            <!--                                            <a
                                                                                            href="#"
                                                                                            class="btn red outline radius-xl "
                                                                                            data-toggle="modal"
                                                                                            data-target="#declineModal"
                                                                                            >Từ chối</a
                                                                                        >-->
                                        </div>
                                    </div>
                                            <p class="ttr-seperate"></p>
                                </div>

                                <!--                                <div
                                                                    class="modal fade review-bx-reply"
                                                                    id="declineModal"
                                                                    tabindex="-1"
                                                                    role="dialog"
                                                                    aria-labelledby="exampleModalLabel"
                                                                    aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5
                                                                                    class="modal-title"
                                                                                    id="exampleModalLabel">
                                                                                    Bạn có chắc là muốn từ chối không?
                                                                                </h5>
                                
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button>
                                                                                    <a href="request-list?service=agree&id=${r.requestID}" class="btn green radius-xl outline">Có</a>
                                                                                </button>
                                
                                                                                <button>
                                                                                    <a href="request-list" class="btn red outline radius-xl ">Không</a>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
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

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>

