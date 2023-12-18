
<%--
Document : index
Created on : Sep 14, 2023, 11:01:55 PM
Author : trant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dal.HouseDAO" %>
<%@page import="java.util.List,java.sql.ResultSet,model.House, dal.HouseDAO, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO, jakarta.servlet.http.HttpSession" %>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"
                             xmlns:h="http://java.sun.com/jsf/html"
                             xmlns:f="http://java.sun.com/jsf/core"> <!--<![endif]-->
    <head>
        <script src="https://kit.fontawesome.com/d662e7eda2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .pagination1 li a {
                text-decoration: none;
                background-color: #3498db;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .pagination1 li a:hover {
                background-color: #297fb8;
            }

            .pagination1 li.active a {
                background-color: #297fb8;
            }

            /* Style for "Previous" and "Next" buttons */
            .pagination1 li:first-child a {
                /* Style for "Previous" button */
            }

            .pagination1 li:last-child a {
                /* Style for "Next" button */
            }

            .pagination1 {
                display: flex;
                list-style: none;
                justify-content: center;
                align-items: center;
                padding: 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination li a {
                text-decoration: none;
                background-color: #3498db;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .pagination li a:hover {
                background-color: #297fb8;
            }

            .pagination .active a {
                background-color: #297fb8;
            }

            .pagination .disabled a {
                pointer-events: none;
                background-color: #ccc;
                color: #555;
            }


            .range-form {
                width: 400px;
                margin: auto;
                padding: 50px;
            }

            .range-slider {
                -webkit-appearance: none;
                /* Override default CSS styles */
                appearance: none;
                width: 100%;
                /* Full-width */
                height: 10px;
                border-radius: 5px;
                /* Specified height */
                background: #d3d3d3;
                /* Grey background */
                outline: none;
                /* Remove outline */
                opacity: 0.7;
                /* Set transparency (for mouse-over effects on hover) */
                -webkit-transition: .2s;
                /* 0.2 seconds transition on hover */
                transition: opacity .2s;
                &:hover {
                    opacity: 1;
                    /* Fully shown on mouse-over */
                }
                &::-webkit-slider-thumb {
                    -webkit-appearance: none;
                    /* Override default look */
                    appearance: none;
                    width: 18px;
                    /* Set a specific slider handle width */
                    height: 18px;
                    /* Slider handle height */
                    background: #4CAF50;
                    /* Green background */
                    cursor: pointer;
                    /* Cursor on hover */
                    border-radius: 50%;
                }
                &::-moz-range-thumb {
                    width: 18px;
                    /* Set a specific slider handle width */
                    height: 18px;
                    /* Slider handle height */
                    background: #4CAF50;
                    /* Green background */
                    cursor: pointer;
                    /* Cursor on hover */
                }
            }

        </style>
        <style>
            .wow fadeInDown{
                float: left;
            }
        </style>
        <style>
            /* Custom pagination style */
            .custom-pagination {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 20px 0;
                justify-content: center;
            }

            .custom-pagination-item {
                margin: 0 5px;
                padding: 5px 10px;
                background-color: #1B1A19;
                color: #fff;
                border-radius: 3px;
                cursor: pointer;
            }

            .custom-pagination-item.active {
                background-color: #0056b3;
            }

            .custom-pagination-item:hover {
                background-color: #0056b3;
            }

            .header-connect {
                position: fixed; /* Set the position to fixed */
                top: 0; /* Stick the header at the top of the viewport */
                right: 0; /* You can adjust this value to control its horizontal position */
                z-index: 1000; /* Adjust the z-index as needed to ensure it's above other content */
                background-color: #333; /* Change the background color as desired */
                color: #fff; /* Change the text color as desired */
                padding: 10px; /* Adjust padding as needed */
                transition: top 0.3s; /* Add a smooth transition effect when the header is fixed */
            }


        </style>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> Muonnha: View All Houses</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword"
              content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link
            href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
            rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
              rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script type="text/javascript">
            var change = function () {
                document.getElementById("f1").submit();

            }
            var change1 = function () {
                document.getElementById("f2").submit();

            }
        </script>
        <script>
            function logOut() {
                window.location.href = "/logout"
            }
        </script>

    </head>
    <body>
        <div>
            <jsp:include page="header.jsp"></jsp:include>   
            </div> 
            <div style="height:200px"></div>



            <!-- Body content -->

            <!--        <div class="header-connect">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-5 col-sm-8  col-xs-12">
                                    <div class="header-half header-call">
                                        <p>
                                            <span><i class="pe-7s-call"></i> +1 234 567 7890</span>
                                            <span><i class="pe-7s-mail"></i>
                                                your@company.com</span>
                                        </p>
                                    </div>
                                </div>
                                <div
                                    class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-12">
                                    <div class="header-half header-social">
                                        <ul class="list-inline">
                                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fa fa-vine"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->

            <!--End top header -->

            <!--        <nav class="navbar navbar-default ">
                        <div class="container">
                             Brand and toggle get grouped for better mobile display 
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed"
                                        data-toggle="collapse" data-target="#navigation">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="home"><img
                                        style="width: 150px;"
                                        src="assets/images/logo_real_white.png" alt></a>
                            </div>
            
                             Collect the nav links, forms, and other content for toggling 
                            <div class="collapse navbar-collapse yamm" id="navigation">
                                <div class="button navbar-right">
        <c:if test="${sessionScope.name!=null}">
            <button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.45s"><a href="logout">LogOut</a></button>
            <span class="dropdown">
                <button class="navbar-btn nav-button wow bounceInRight login" type="button" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <c:if test="${sessionScope.fullname != null}">
                Hello ${sessionScope.fullname} <img style="width:30px;height:30px" src="${sessionScope.photo}"></img> &#9660;  &#9660; is the HTML entity for down arrow 
            </c:if>
        </button>
        <ul style="position: absolute; right: 160px; background-color: rgb(119, 119, 119); top: 80px;" class="dropdown-menu" aria-labelledby="userDropdown">
            <c:if test="${sessionScope.account.getRoleId() == 3}">
                <li>
                    <a href="viewyourhouses?accountId=${sessionScope.accountid}">Go Dashboard</a>
                </li>
                <li>
                    <a href="index-3.html">Profile Settings</a>
                </li>
                <li>
                    <a href="index-4.html">Become Partners</a>
                </li>
                <li class="wow fadeInDown" data-wow-delay="0.2s">
                <c:if test="${sessionScope.name!=null}">
                    <a class href="viewyourhouses?accountId=${sessionScope.accountid}">View Houses</a>
                </c:if>
            </li>
            </c:if>
        </ul>
    </span>
        </c:if>
        <c:if test="${sessionScope.name==null}">
            <button class="navbar-btn nav-button wow bounceInRight login" data-wow-delay="0.45s"><a href="login">LogIn</a></button>
        </c:if>
    </div>
    <ul class="main-nav nav navbar-nav navbar-left">
        <li class="wow fadeInDown" data-wow-delay="0.2s"><a class href="home">Home</a></li>
        <li class="wow fadeInDown" data-wow-delay="0.2s"><a class href="properties.html">Blog</a></li>
        <li class="wow fadeInDown" data-wow-delay="0.3s"><a class href="viewyourhouses?accountId=${sessionScope.accountid}">DashBoard</a></li>
        <li class="wow fadeInDown" data-wow-delay="0.2s">
        <c:if test="${sessionScope.name!=null}">
            <a class href="viewyourhouses?accountId=${sessionScope.accountid}">View Houses</a>
        </c:if>
    </li>
     <li class="wow fadeInDown" data-wow-delay="0.5s"><a href="contact.html">Contact</a></li> 
</ul>
</div>


/.navbar-collapse 
</div> /.container-fluid 
</nav>-->
        <!-- End of nav bar -->
        <form style="margin-top:40px" action="viewhouses" >
            <div style="width:33%;margin-left: 500px;margin-top: 30px" class="input-group">
                <input name="key2" type="text" class="form-control"  placeholder="Search">
                
                    <!--<button class="btn btn-default" type="submit">Tìm</button>-->
                    <button class="btn btn-simple form-group-sm" type="submit">Search</button>

                
            </div>





            <div style="width:33%;margin-left: 500px;margin-top: 30px" class="form-group row">

                <label>Houses that have Room's fee in range :</label>
                <br>
                <div class="input-group mb-3">

                    <input name="fromprice" type="number" class="form-control" placeholder="From" aria-label="Username">

                    <span class="input-group-text"><i class="fa-solid fa-arrow-right"></i></span>



                    <input name="toprice" type="number" class="form-control" placeholder="To" aria-label="Server">
                </div>

                <!--<button type="submit" class="btn btn-light">Search Electrical Fee</button>-->
            </div>
      



        </form>

        <%
            if(request.getAttribute("sort")!=null){
        List<House> list= (List<House>)request.getAttribute("houseList");
 HttpSession ss = request.getSession();
        ss.setAttribute("tosort",list);     
            }
           

       
        %>

        <!-- property area -->
        <div class="content-area home-area-1 recent-property"
             style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">
                <div class="row">
                    <div
                        class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <!-- /.feature title -->
                        <h2>HOUSE LIST</h2>
                        
                    </div>
                </div>
                <div>
                    <div style="display:flex;flex-direction: row">
                         <form style="width:15%" action="viewhouses" id="f1">
                        <c:set var="cid" value="${requestScope.cid}" />


                        <div class="form-group">
                            <select name="key" onchange="change()" class="form-control">
                                <option onclick="change()" value="0">ALL</option>
                                <c:forEach items="${requestScope.data}" var="c">
                                    <option ${(cid==c.getCategoryID())?'selected':''} value="${c.getCategoryID()}">${c.getCategory()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </form>

                    <form style="width:15%" action="viewhouses" id="f2">
                        <c:set var="sort" value="${requestScope.sort}" />


                        <div class="form-group">
                            <select name="sort" onchange="change1()" class="form-control">
                                <option onclick="change1()" value="0">Minimun Price Sort</option>

                                <option  value="lowtohigh">Low To High</option>
                                <option  value="hightolow">High To Low</option>


                            </select>
                        </div>
                    </form>
                    </div>
                   


<!--                    <form action="viewhouses" method="GET" id="sort">
                        <div style="display:flex;flex-direction: row" class="">
                            <div>
                                <label for="">Sort All Houses By Min Price: </label>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-primary" name="sort" value="lowtohigh">Low to High</button>
                            </div>



                            <div>
                                <button type="submit" class="btn btn-primary" name="sort" value="hightolow">High to Low</button>     
                            </div>

                        </div>
                    </form>-->

                </div>



                <div class="">
                    <div class="proerty-th">
                        <h2 style="color:red">${requestScope.noresult}</h2>
                        <c:forEach var="list" items="${requestScope.houseList}">
                            <c:set var="houseID" value="${list.getHouseID()}" />

                            <div class="col-md-3" >
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a
                                            href="viewhouse?houseId=${list.getHouseID()}"><img
                                                src="${list.getPreviewImage().getImagePath()}"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a
                                                href="viewhouse?houseId=${list.getHouseID()}">${list.getName()}
                                            </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b>City :</b>
                                            ${list.city} </span>
                                        <br>
                                        <div class="pull-left"><b style="color:red">From Price :</b>

                                            <%
                                               
                                            HouseDAO hd= new HouseDAO();
                                            double price=hd.getMinRoomPriceByHouseId((int) pageContext.getAttribute("houseID"));
                                            %>
                                            <fmt:formatNumber pattern="#,##0VND/month" value="<%= price %>"></fmt:formatNumber>
                                            </div>
                                            <br>
                                            <span class="proerty-status pull-right">${list.status}</span>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                    </div>

                </div>
                <!--                <ul class="custom-pagination">
                                    <li class="custom-pagination-item active">1</li>
                                    <li class="custom-pagination-item">2</li>
                                    <li class="custom-pagination-item">3</li>
                                    <li class="custom-pagination-item">4</li>
                                    <li class="custom-pagination-item">5</li>
                                </ul>-->
                <br>



            </div>
            <nav  aria-label="Page navigation">
                <c:set value="${requestScope.page}" var="page" />
                <ul class="pagination1">
                    <li ><a href="viewhouses?page=${page-1}&key=${requestScope.cid}&sort=${requestScope.sortp}&fromprice=${requestScope.fromprice}&toprice=${requestScope.toprice}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>

                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <li class="page-item <c:if test='${page == i}'>active</c:if>">


                                <a class="page-link hoverDat" href="viewhouses?page=${i}&key=${requestScope.cid}&sort=${requestScope.sortp}&fromprice=${requestScope.fromprice}&toprice=${requestScope.toprice}">${i}</a>
                        </li>
                        <!--<li class="page-item <c:if test='${page == i}'>active</c:if>">
                            <a class="page-link hoverDat" href="list?page=${i}">${i}</a>
                        </li>-->
                    </c:forEach>

                        <li ><a  href="viewhouses?page=${page+1}&key=${requestScope.cid}&sort=${requestScope.sortp}&fromprice=${requestScope.fromprice}&toprice=${requestScope.toprice}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                </ul>
            </nav>
        </div>

        <script>
          
            function sort() {
                var a = document.getElementById("sort");
                a.submit();

            }
            var a = document.getElementById("sort");
            const radio = document.querySelector('input[type="radio"]');
            radio.addEventListener("change", function () {
                if (radio.checked) {
                    // If the radio button is checked, submit the form
                    a.submit();
                }
            });
        </script>
        <script src="assets/js/modernizr-2.6.2.min.js"></script>

        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>

        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/price-range.js"></script>

        <script src="assets/js/main.js"></script>
        <script>
            // Lắng nghe sự kiện kéo trang
            window.addEventListener("scroll", function () {
                var header = document.getElementById("site-header");
                if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                    header.style.top = "-50px"; // Biến mất header khi kéo xuống
                } else {
                    header.style.top = "0"; // Hiển thị lại header khi kéo lên
                }
            });

        </script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
