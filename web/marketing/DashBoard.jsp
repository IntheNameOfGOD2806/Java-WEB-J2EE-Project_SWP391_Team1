<%-- 
    Document   : Dashboard
    Created on : Sep 25, 2023, 2:58:40 PM
    Author     : dang9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.Profile, model.House, model.Feedback, model.Blog, model.Advertisement, dal.ProfileDAO, dal.HouseDAO, java.text.DecimalFormat"%>
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
        <meta name="description" content="Marketing DashBoard" />

        <!-- OG -->
        <meta property="og:title" content="Marketing DashBoard" />
        <meta property="og:description" content="Marketing DashBoard" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Marketing DashBoard </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="marketing/assets/js/html5shiv.min.js"></script>
        <script src="marketing/assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="marketing/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="marketing/assets/css/color/color-1.css">

    </head>

    <%
        ProfileDAO profileDAO = new ProfileDAO();
        HouseDAO houseDAO = new HouseDAO();
        List<Blog> listBlog =(List<Blog>)request.getAttribute("listBlog");
        List<Feedback> listFeedback =(List<Feedback>)request.getAttribute("listFeedback");
        List<Advertisement> listNewAds = (List<Advertisement>)request.getAttribute("listNewAds");
        List<Advertisement> listOldAds = (List<Advertisement>)request.getAttribute("listOldAds");
        List<Integer> pro = (List<Integer>) request.getAttribute("profitpm");
    %>

    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="/marketing/Header.jsp"></jsp:include>
            <!--Main container start -->
            <main class="ttr-wrapper">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <h5 class="breadcrumb-title">Dashboard</h5>
                        <ul class="db-breadcrumb-list">
                            <li><a href="MKTDashboard"><i class="fa fa-home"></i>Home</a></li>
                            <li>Dashboard</li>
                        </ul>
                    </div>	
                    <!-- Card -->
                    <div class="row">
                        <div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
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
                    <div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
                        <div class="widget-card widget-bg2">					 
                            <div class="wc-item">
                                <h5 class="wc-title">
                                    Number of Advertised House
                                </h5>
                                <span class="wc-item">
                                    <%=request.getAttribute("adsHouse")%>/<%=request.getAttribute("allHouse")%>
                                </span>
                            </div>				      
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
                        <div class="widget-card widget-bg3">					 
                            <div class="wc-item">
                                <h5 class="wc-title">
                                    Number of Blog
                                </h5>
                                <span class="wc-item">
                                    <%=listBlog.size()%>
                                </span>
                            </div>				      
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 col-xl-3 col-sm-6 col-12">
                        <div class="widget-card widget-bg3">					 
                            <div class="wc-item">
                                <h5 class="wc-title">
                                    Number of Feedback
                                </h5>
                                <span class="wc-item">
                                    <%=listFeedback.size()%>
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
                                <h5>New Advertised House</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i< listNewAds.size(); i++) {
                                            House house = houseDAO.getHouseByHouseId(listNewAds.get(i).getHouseId());
                                        %>
                                        <li>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="viewhouse?houseId=<%=house.getHouseID()%>" class="new-users-text-name"><%=house.getName()%></a>
                                                </span>
                                            </div>
                                            <%
                                                double adsFee = listNewAds.get(i).getAdsFee();
                                                DecimalFormat formatter = new DecimalFormat("#,###");
                                                String feeString = formatter.format(adsFee);
                                            %>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=feeString%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listNewAds.get(i).getStartDate2()%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listNewAds.get(i).getEndDate2()%></span>
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
                                <h5>Advertisement is about to expire</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i< listOldAds.size(); i++) {
                                            House house = houseDAO.getHouseByHouseId(listOldAds.get(i).getHouseId());
                                        %>
                                        <li>
                                            <div class="col-lg-3">
                                                <span class="new-users-text">
                                                    <a href="viewhouse?houseId=<%=house.getHouseID()%>" class="new-users-text-name"><%=house.getName()%></a>
                                                </span>
                                            </div>
                                            <%
                                                double adsFee = listOldAds.get(i).getAdsFee();
                                                DecimalFormat formatter = new DecimalFormat("#,###");
                                                String feeString = formatter.format(adsFee);
                                            %>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=feeString%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listOldAds.get(i).getStartDate2()%></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listOldAds.get(i).getEndDate2()%></span>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h5>New Blog</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i < listBlog.size(); i++) {
                                            Profile tenantProfile = profileDAO.getProfileByAccountId(listBlog.get(i).getAccountId());
                                        %>
                                        <li>
                                            <div class="col-lg-1">
                                                <span class="new-users-pic">
                                                    <img src="<%=tenantProfile.getPhoto()%>" alt=""/>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">    
                                                <span class="new-users-text">
                                                    <a href="view_profile_other?aid=<%=listBlog.get(i).getAccountId()%>" class="new-users-text-name"><%=tenantProfile.getFullName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-5">
                                                <span class="new-users-text">
                                                    <a href="BlogDetail?BlogID=<%=listBlog.get(i).getBlogId()%>" class="new-users-text-name"><%=listBlog.get(i).getTitle()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span class="new-users-info"><%=listBlog.get(i).getCreateDate()%></span>
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
                                <h5>New Feedback</h5>
                            </div>
                            <div class="widget-inner">
                                <div class="new-user-list">
                                    <ul>
                                        <%for (int i = 0; i < 5 && i < listFeedback.size(); i++) {
                                            House house = houseDAO.getHouseByHouseId(listFeedback.get(i).getHouseId());
                                            Profile tenantProfile = profileDAO.getProfileByAccountId(listFeedback.get(i).getAccountId());
                                        %>
                                        <li>
                                            <div class="col-lg-4">
                                                <span class="new-users-text">
                                                    <a href="view_profile_other?aid=<%=listFeedback.get(i).getAccountId()%>" class="new-users-text-name"><%=tenantProfile.getFullName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-4">
                                                <span class="new-users-text">
                                                    <a href="viewhouse?houseId=<%=house.getHouseID()%>" class="new-users-text-name"><%=house.getName()%></a>
                                                </span>
                                            </div>
                                            <div class="col-lg-4">
                                                <span class="new-users-info"><%=listFeedback.get(i).getCreateDate()%></span>
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

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
</html>
