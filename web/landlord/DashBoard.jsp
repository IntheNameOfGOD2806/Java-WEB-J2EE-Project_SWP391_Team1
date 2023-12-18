<%-- 
    Document   : Dashboard
    Created on : Sep 25, 2023, 2:58:40 PM
    Author     : dang9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.Profile, model.Request, model.Constract, model.Advertisement, model.House, dal.ProfileDAO, dal.HouseDAO, java.text.DecimalFormat"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="Landlord DashBoard" />

        <!-- OG -->
        <meta property="og:title" content="Landlord DashBoard" />
        <meta property="og:description" content="Landlord DashBoard" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Landlord DashBoard</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="landlord/assets/js/html5shiv.min.js"></script>
        <script src="landlord/assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="landlord/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="landlord/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="landlord/assets/css/color/color-1.css">

    </head>

    <%
        ProfileDAO profileDAO = new ProfileDAO();
        HouseDAO houseDAO = new HouseDAO();
        List<Request> listRequest =(List<Request>)request.getAttribute("listRequest");
        List<Constract> listContract =(List<Constract>)request.getAttribute("listContract");
        List<Constract> listNewContract =(List<Constract>)request.getAttribute("listNewContract");
        List<Advertisement> listAds = (List<Advertisement>)request.getAttribute("listAds");
        List<Integer> pro = (List<Integer>) request.getAttribute("profitpm");
    %>

    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="/landlord/Header.jsp"></jsp:include>
            <!--Main container start -->
            <main class="ttr-wrapper" id="houseContent">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h5 class="breadcrumb-title">Dashboard</h5>
                        <ul class="db-breadcrumb-list">
                            <li><a href="Dashboard"><i class="fa fa-home"></i>Home</a></li>
                            <li>Dashboard</li>
                        </ul>
                    </div>	
                    <!-- Card -->
                    <div class="row">
                        <div class="col-md-6 col-lg-4 col-xl-4 col-sm-6 col-12">
                            <div class="widget-card widget-bg1">					 
                                <div class="wc-item">
                                    <h5 class="wc-title">
                                        Total Revenue
                                    </h5>
                                    <span class="wc-item"><fmt:formatNumber value = "${profit}" type = "number"/></span> VND
                                </span>
                            </div>				      
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4 col-sm-6 col-12">
                        <div class="widget-card widget-bg2">					 
                            <div class="wc-item">
                                <h5 class="wc-title">
                                    Rented Rooms
                                </h5>
                                <span class="wc-item">
                                    <%=request.getAttribute("rentedRoom")%>/<%=request.getAttribute("allRoom")%>
                                </span>
                            </div>				      
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4 col-sm-6 col-12">
                        <div class="widget-card widget-bg3">					 
                            <div class="wc-item">
                                <h5 class="wc-title">
                                    Number Of Request 
                                </h5>
                                <span class="wc-item">
                                    <%=listRequest.size()%>
                                </span>
                            </div>				      
                        </div>
                    </div>
                </div>
                <!-- Card END -->
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-8 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>Monthly Revenue</h5>
                            </div>
                            <div class="widget-inner">
                                <canvas id="chart" width="100" height="45"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                    <div class="col-lg-6 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>New Tenant</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i< listNewContract.size(); i++) {
                                            Profile tenantProfile = profileDAO.getProfileByAccountId(listNewContract.get(i).getAccountID());
                                        %>
                                        <li>
                                            <div class="col-lg-1">
                                                <span class="new-users-pic">
                                                    <img src="<%=tenantProfile.getPhoto()%>" alt=""/>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="view_profile_other?aid=<%=listNewContract.get(i).getAccountID()%>" class="new-users-text-name"><%=tenantProfile.getFullName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listNewContract.get(i).getStartDate2()%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <%if (listNewContract.get(i).getEndDate2() != null){%>
                                                <span class="new-users-info"><%=listNewContract.get(i).getEndDate2()%></span>
                                                <%}%>
                                            </div>
                                            <div class="col-lg-2">
                                                <span class="new-users-info"><%=listNewContract.get(i).getRoomID()%></span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>Contract is about to expire</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i< listContract.size(); i++) {
                                            Profile tenantProfile = profileDAO.getProfileByAccountId(listContract.get(i).getAccountID());
                                        %>
                                        <li>
                                            <div class="col-lg-1">
                                                <span class="new-users-pic">
                                                    <img src="<%=tenantProfile.getPhoto()%>" alt=""/>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="view_profile_other?aid=<%=listContract.get(i).getAccountID()%>" class="new-users-text-name"><%=tenantProfile.getFullName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listContract.get(i).getStartDate2()%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <%if (listNewContract.get(i).getEndDate2() != null){%>
                                                <span class="new-users-info"><%=listNewContract.get(i).getEndDate2()%></span>
                                                <%}%>
                                            </div>
                                            <div class="col-lg-2">
                                                <span class="new-users-info"><%=listContract.get(i).getRoomID()%></span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>New Request</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i < listRequest.size(); i++) {
                                            Profile tenantProfile = profileDAO.getProfileByAccountId(listRequest.get(i).getAccountID());
                                            House house = houseDAO.getHouseByRoomId(listRequest.get(i).getRoomID());
                                        %>
                                        <li>
                                            <div class="col-lg-1">
                                                <span class="new-users-pic">
                                                    <img src="<%=tenantProfile.getPhoto()%>" alt=""/>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="view_profile_other?aid=<%=listRequest.get(i).getAccountID()%>" class="new-users-text-name"><%=tenantProfile.getFullName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listRequest.get(i).getRequestDate()%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=house.getName()%></span>
                                            </div>
                                            <div class="col-lg-2">
                                                <span class="new-users-info"><%=listRequest.get(i).getRoomID()%></span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>Ads</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i < listAds.size(); i++) {
                                            House house = houseDAO.getHouseByHouseId(listAds.get(i).getHouseId());
                                        %>
                                        <li>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="#" class="new-users-text-name"><%=house.getName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info">
                                                    <span class="new-users-info"><%=listAds.get(i).getStartDate2()%></span>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info">
                                                    <span class="new-users-info"><%=listAds.get(i).getEndDate2()%></span>
                                                </span>
                                            </div>
                                                <%
                                                    double adsFee = listAds.get(i).getAdsFee();
                                                    DecimalFormat formatter = new DecimalFormat("#,###");
                                                    String feeString = formatter.format(adsFee);
                                                %>
                                            <div class="col-lg-3">
                                                <span class="new-users-info">
                                                    <span class="new-users-info"><%=feeString%></span>
                                                </span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
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
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                displayGraph();
            });
            function displayGraph() {
                const month = ${profitmonth};
                Chart.defaults.global.defaultFontFamily = "rubik";
                Chart.defaults.global.defaultFontColor = '#999';
                Chart.defaults.global.defaultFontSize = '12';
                var ctx = document.getElementById('chart').getContext('2d');
                new Chart(ctx, {
                    type: 'line',
                    // The data for our dataset
                    data: {
                        labels: month,
                        // Information about the dataset
                        datasets: [{
                                label: "Views",
                                backgroundColor: 'rgba(0,0,0,0.05)',
                                borderColor: '#4c1864',
                                borderWidth: "3",
                                data: ${profitpm},
                                pointRadius: 4,
                                pointHoverRadius: 4,
                                pointHitRadius: 10,
                                pointBackgroundColor: "#fff",
                                pointHoverBackgroundColor: "#fff",
                                pointBorderWidth: "3"
                            }]
                    },
                    // Configuration options
                    options: {
                        layout: {
                            padding: 0
                        },
                        legend: {display: false},
                        title: {display: false},
                        scales: {
                            yAxes: [{
                                    scaleLabel: {
                                        display: false
                                    },
                                    gridLines: {
                                        borderDash: [6, 6],
                                        color: "#ebebeb",
                                        lineWidth: 1
                                    }
                                }],
                            xAxes: [{
                                    scaleLabel: {display: false},
                                    gridLines: {display: false}
                                }]
                        },

                        tooltips: {
                            backgroundColor: '#333',
                            titleFontSize: 12,
                            titleFontColor: '#fff',
                            bodyFontColor: '#fff',
                            bodyFontSize: 12,
                            displayColors: false,
                            xPadding: 10,
                            yPadding: 10,
                            intersect: false
                        }
                    }
                });
            }
            ;
        </script>
    </body>
</html>
