<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="model.Blog,java.util.List,model.Profile,dal.ProfileDAO" %>
    <!-- Mirrored from educhamp.themetrades.com/demo/marketing/bookmark.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Search Blog</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
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
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <style type="text/css">
            table{
                border-collapse: collapse
            }
            .content{
                margin: auto;
                width: 80%;
                float: left;
                margin-left: 30px;
                height: auto
            }
            .pagination {
                display: inline-block;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;

            </style>
            <jsp:include page="Header.jsp"></jsp:include>

                <!--Main container start -->
                <main class="ttr-wrapper">
                    <div class="container-fluid" style="border: outset">
                            <div class="db-breadcrumb">
                                <h4 class="breadcrumb-title">Blog List</h4>
                                <ul class="db-breadcrumb-list">
                                    <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                                    <li>Blog List</li>

                                </ul>

                            </div>	
                            <div class="row">
                                <!-- Your Profile Views Chart -->
                            <% 
        List<Blog> Bl = (List<Blog>)request.getAttribute("dataBL");
                            %>  
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="wc-title">
                                        <h4>Blog List</h4>
                                    </div>
                                    <div class="col-lg-6 col-6 text-left">
                                        <form action="searchblog" method="post">
                                            <div class="input-group">
                                                <input oninput="SearchbyTitle(param)" name="title" type="text" class="form-control" placeholder="Search for Blog">
                                                <div class="input-group-append">
                                                    <span class="input-group-text bg-transparent text-primary">
                                                        <button type="submit" style="border: none"><i class="fa fa-search"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <%for(Blog BL: Bl){%>
                                    <div id="content" class="widget-inner">
                                        <div class="card-courses-list bookmarks-bx">
                                            <div class="card-courses-media">
                                                <img src="<%=BL.getPhoto()%>" alt=""/>
                                            </div>
                                            <div class="card-courses-full-dec">
                                                <div class="card-courses-title">
                                                    <h4 class="m-b5"><%=BL.getTitle()%></h4>
                                                </div>
                                                <div class="card-courses-list-bx">
                                                    <ul class="card-courses-view">
                                                        <li class="card-courses-categories" >
                                                            <h5>Arthur</h5>
                                                            <%
                                                                        ProfileDAO profileDAO = new ProfileDAO();
                                                                        Profile p = profileDAO.getProfileByAccountId(BL.getAccountId());
                                                            %>
                                                            <h4><%=p.getFullName()%></h4>
                                                        </li>
                                                        <li class="card-courses-categories" style="margin-left: 80px;">
                                                        <h5>Create Date</h5>
                                                        <h5><%=BL.getCreateDate()%></h5>
                                                    </li>

                                                    <li class="card-courses-categories" style="margin-left: 80px;">
                                                        <h5>Status</h5>
                                                        <%if(BL.isStatus() == true){%>
                                                        <h5 class="text-primary m-b0">Onl</h5>
                                                        <%}%>
                                                        <%if(BL.isStatus() == false){%>
                                                        <h5 class="text-primary m-b0">Off</h5>
                                                        <%}%>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row card-courses-dec">
                                                <div class="col-md-12">
                                                    <p><%=BL.getBriefInfor()%></p>	
                                                </div>
                                                <div class="col-md-12">
                                                    <a href="editBlog?BlogID=<%=BL.getBlogId()%>" ><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 576 512"><style>svg{
                                                                fill:#f50000
                                                            }</style><path d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"/></svg></a>
                                                    <a href="bloglist?go=changeStatus&BlogID=<%=BL.getBlogId()%>&Status=<%=BL.isStatus()%>" ><svg xmlns="http://www.w3.org/2000/svg" height="1.25em" viewBox="0 0 512 512"><style>svg{
                                                                fill:#f53d00
                                                            }</style><path d="M0 168v-16c0-13.255 10.745-24 24-24h360V80c0-21.367 25.899-32.042 40.971-16.971l80 80c9.372 9.373 9.372 24.569 0 33.941l-80 80C409.956 271.982 384 261.456 384 240v-48H24c-13.255 0-24-10.745-24-24zm488 152H128v-48c0-21.314-25.862-32.08-40.971-16.971l-80 80c-9.372 9.373-9.372 24.569 0 33.941l80 80C102.057 463.997 128 453.437 128 432v-48h360c13.255 0 24-10.745 24-24v-16c0-13.255-10.745-24-24-24z"/></svg></a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <div class="pagination">
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <a class="${i==page?"active":""}" href="searchblog?page=${i}&title=${key}">${i}</a>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                        <!-- Your Profile Views Chart END-->
                    </div>
                </div>
            </main>
            <div class="ttr-overlay"></div>

            <!-- External JavaScripts -->

            <!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
            <script>
                function SearchbyTitle(param) {
                    var titleSearch = param.value;
                    $.ajax({
                        url: "houseRent/SeachBlog",
                        type: "get", //send it through get method
                        data: {
                            title: titleSearch
                        },
                        success: function (data) {
                            var row = document.getElementById("content");
                            row.innerHTML = data;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
            </script>
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

        <!-- Mirrored from educhamp.themetrades.com/demo/marketing/bookmark.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
    </html>