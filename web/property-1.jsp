<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : properties-1
    Created on : Sep 16, 2023, 5:29:38 PM
    Author     : trant
--%>
<%@ page import="model.House" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>

        <!-- CSS của slick-carousel -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
        <link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">


        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>View Detail</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/lightslider.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
    </head>
    <body>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->

        <jsp:include page="header.jsp"></jsp:include>       
            <!--End top header -->


            <!-- End of nav bar -->
            <div style="height: 136px"></div>
            <div class="page-head"> 
                <div class="container">
                    <div class="row">
                        <div class="page-head-content">
                            <h1 class="page-title">House Detail </h1>               
                        </div>
                    </div>
                </div>
            </div>
            <!-- End page header -->

            <!-- property area -->
            <div class="content-area single-property" style="background-color: #FCFCFC;">&nbsp;
                <div class="container">   

                    <div class="clearfix padding-top-40" >

                        <div class="col-md-8 single-property-content prp-style-1 ">
                            <div class="row">
                                <div class="light-slide-item">            
                                    <div class="clearfix">
                                        <div class="favorite-and-print">
                                         
                                            <a class="printer-icon " href="javascript:window.print()">
                                                <i class="fa fa-print"></i> 
                                            </a>
                                        </div> 

                                        <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                <c:forEach var="image" items="${requestScope.listImage}">
    <c:if test="${not empty image.getImagePath()}">
        <li data-thumb="${image.getImagePath()}"> 
            <img style="width: 100%; height: 50%" src="${image.getImagePath()}" />
        </li>
    </c:if>
</c:forEach>



                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left">${requestScope.house.getName()}</h1>
                                <span class="property-price pull-right"><fmt:formatNumber pattern="#,##0VND/month" value="${requestScope.housePrice}"></fmt:formatNumber></span>
                                </div>

                                <div class="property-meta entry-meta clearfix ">   

                                    <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                        <span class="property-info-icon icon-tag">                                        
                                            <img src="assets/img/icon/sale-orange.png">
                                        </span>
                                        <span class="property-info-entry">

                                            <span class="property-info-label">Status</span>
                                            <span class="property-info-value">${requestScope.house.getStatus()}</span>
                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <img src="assets/img/icon/room-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Area</span>
                                        <span class="property-info-value">${requestScope.sqr}<b class="property-info-unit">m²</b></span>
                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <img src="assets/img/icon/bed-orange.png">
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bedrooms</span>
                                        <span class="property-info-value">${requestScope.listRoom.size()}</span>
                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <img src="assets/img/icon/cars-orange.png">
                                    </span>

                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">

                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bathrooms</span>
                                        <span class="property-info-value">${requestScope.listRoom.size()}</span>
                                    </span>
                                </div>



                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">


                                </div>


                            </div>
                            <!-- .property-meta -->
                                <div class="section">
                                <h4 class="s-property-title">Category</h4>
                                <div class="s-property-content">
                                    <p> ${requestScope.category.getCategory()}    </p>
                                </div>
                            </div>
                            <div class="section">
                                <h4 class="s-property-title">Description</h4>
                                <div class="s-property-content">
                                    <p> ${requestScope.house.getDescription()}    </p>
                                </div>
                            </div>
                            <div class="section">
                                <h4 class="s-property-title">Address</h4>
                                <div class="s-property-content">
                                    <p> ${requestScope.house.getAddress()}    </p>
                                </div>
                            </div>
                            <!-- End description area  -->

                            <div class="section additional-details">
                                <div class="section additional-details">

                                    <h4 class="s-property-title">Additional Detail</h4>
                                    <%
                                               
                                     House hd= (House)request.getAttribute("house");
                                     double price1=hd.getElectricalFee();
                                     double price2=hd.getWaterFee();
                                    %>                                   

                                    <b class="">Electrical fee:</b> <fmt:formatNumber pattern="#,##0VND/month" value="<%=price1%>"></fmt:formatNumber><br>
                                    <b class="">Water fee:</b> <fmt:formatNumber pattern="#,##0VND/month" value="<%=price2%>"></fmt:formatNumber><br>


                                    </div>  

                                    <h2 style="color:red">${requestScope.duprequest}</h2>
                                <h2 style="color:red">${requestScope.success}</h2>


                                <h4 class="s-property-title">Rooms Detail</h4>

                                <ul class="additional-details-list clearfix" style="display:flex; flex-direction: row">
                                    <h2 style="color:red">${requestScope.noresult}</h2>
                                                                        <!--<h2 style="color:red">${requestScope.duprequest}</h2>-->

                                    <c:forEach var="list" items="${requestScope.listRoom}">

                                        <li>
                                            <div class="col-md-10 p0">
                                                <div class="box-two proerty-item">
                                                    <div class="item-thumb">
                                                        <a href="property-1.html" ><img src="https://img.freepik.com/free-photo/home-icon-front-side-with-white-background_187299-40059.jpg?w=740&t=st=1694864008~exp=1694864608~hmac=6ea3614b4e205480034e02fc6db34958eceb7da781460bef1628b045594b5933"></a>
                                                    </div>

                                                    <div class="item-entry overflow">
                                                        <h5><a href="property-1.html"> Room for rent </a></h5>
                                                        <div class="dot-hr"></div>
                                                        <span class="pull-left"><b> Area :</b> ${list.getArea()} m² </span>
                                                        <br>

                                                        <div class="proerty-price "> <b> Price :</b><fmt:formatNumber pattern="#,##0VND/month" value="${list.getPrice()}"></fmt:formatNumber></div>
                                                        <div class="proerty-price pull-right"> <b style="color:red">${list.getStatus()}</b></div>
                                                        <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                                        <div class="property-icon">
                                                            <c:if test="${sessionScope.accountid eq null}">
                                                                <div class="nav-button ">                                        

                                                                    <span href="#" >You Must Login to use this function</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${sessionScope.accountid != null}">
                                                                <c:if test="${requestScope.house.getStatus() eq 'Not for Rent'}">
                                                                     <div class="nav-button ">                                        

                                                                        <span href="#" class="" style="text-decoration: navy;">Landlord has closed Rent request for this house</span>
                                                                    </div>
                                                                </c:if>
                                                            
                                                                <c:if test="${requestScope.house.getStatus() eq 'Active'}">
                                                                      <c:if test="${list.getStatus() eq 'Active'}">
                                                                    <div class="nav-button ">                                        

<!--                                                                    <a href="createrequest?accountid=${sessionScope.accountid}&roomid=${list.getRoomID()}"
                                                                       class="button">Rent</a>-->
                                                                        <a   href="createrequest?accountid=${sessionScope.accountid}&roomid=${list.getRoomID()}" class="button">Rent</a>
                                                                    </div>
                                                                    
                                                                </c:if>
                                                                          <c:if test="${list.getStatus() eq 'Hired'}">
                                                                    <div class="nav-button ">                                        

                                                                        <span href="#" class="" style="text-decoration: line-through;">Rent</span>
                                                                    </div>
                                                                </c:if>
                                                                    
                                                                    
                                                                </c:if>
                                                              
                                                            </c:if>

                                                        </div>
                                                    </div>

                                                </div> 
                                            </div>
                                        </li>

                                    </c:forEach>




                                </ul>
                            </div>  
                            <!--                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#feedbackModal">
                                                                                        Bấm để phản hồi
                                                                                    </button>
                                                        
                                                                                     Modal 
                                                                                    <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                                        <div class="modal-dialog" role="document">
                                                                                            <div class="modal-content">
                                                                                                <div class="modal-header">
                                                                                                    <h5 class="modal-title" id="exampleModalLabel">Phản hồi của bạn</h5>
                                                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                        <span aria-hidden="true">&times;</span>
                                                                                                    </button>
                                                                                                </div>
                                                                                                <div class="modal-body">
                                                                                                     Form phản hồi 
                                                                                                    <form>
                                                                                                        <div class="form-group">
                                                                                                            <label for="feedbackMessage">Nội dung phản hồi</label>
                                                                                                            <textarea class="form-control" id="feedbackMessage" rows="4"></textarea>
                                                                                                        </div>
                                                                                                    </form>
                                                                                                </div>
                                                                                                <div class="modal-footer">
                                                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                                                    <button type="button" class="btn btn-primary">Gửi phản hồi</button>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>-->





                            <!--feedback-->


                            <!-- End additional-details area  -->


                            <!-- End video area  -->




                            <!-- End video area  -->

                        </div>
                    </div>


                    <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="${requestScope.landlordInfo.getPhoto()}" class="img-circle">
                                                </a>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <a href="">${requestScope.landlordInfo.getFullName()}</a>
                                                    <br>
                                                    <span>Landlord</span>        
                                                </h3>


                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts">                                       
                                                <li><i class="pe-7s-call strong "> </i> ${requestScope.landlordInfo.getPhone()}</li>
                                                <li><i class="pe-7s-map-marker strong"> </i> ${requestScope.landlordInfo.getDOB()}</li>
                                                <li><i class=" pe-7s-mail strong"> </i> ${requestScope.landlordInfo.getEmail()}</li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Similar House</h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <ul>
                                        <c:forEach var="sim" items="${requestScope.similar}">
                                            <li>
                                                <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                    <a href="viewhouse?houseId=${sim.getHouseID()}"><img src="${sim.getPreviewImage().getImagePath()}"></a>

                                                </div>
                                                <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                    <h6> <a href="viewhouse?houseId=${sim.getHouseID()}">${sim.getName()} </a></h6>


                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>                          

                        </aside>
                    </div>
                </div>

            </div>
                                               
                                                        <div id="ff">
                <jsp:include page="/landlord/feedback.jsp"></jsp:include>
            </div>
                                                
        

        </div>


        <script>
          function confirmRoomRental(accountID, roomID) {
        var confirmation = confirm("Are you sure you want to rent this room?");
        if (confirmation) {
            // If the user clicks "OK," proceed with the rental
            window.location.href = "createrequest?accountid=" + accountID + "&roomid=" + roomID;
        } else {
            // If the user clicks "Cancel," do nothing or provide feedback
            console.log("Room rental request canceled.");
        }
    }
        </script>
        <script>
            $(document).ready(function () {
                $('.hash-list').slick({
                    infinite: true, // Vô hạn lặp
                    slidesToShow: 3, // Số lượng phần tử hiển thị trên mỗi slide
                    slidesToScroll: 1, // Số lượng phần tử trượt khi bạn click nút "Next" hoặc "Prev"
                    autoplay: true, // Tự động trượt
                    autoplaySpeed: 3000, // Thời gian chờ giữa các slide (3 giây)
                });
            });
        </script>
        <!-- JavaScript của slick-carousel -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>       
        <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
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
        <script type="text/javascript" src="assets/js/lightslider.min.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
            function confirm(accountid, roomid) {
                if (confirm("You sure want to send the request for this room?")) {


                    window.href.url = "createrequest?accountid=" + accountid + "&roomid=" + roomid;
                }

            }
            $(document).ready(function () {

                $('#image-gallery').lightSlider({
                    gallery: true,
                    item: 1,
                    thumbItem: 9,
                    slideMargin: 0,
                    speed: 500,
                    auto: true,
                    loop: true,
                    onSliderLoad: function () {
                        $('#image-gallery').removeClass('cS-hidden');
                    }
                });
            });
        </script>
        <script>

            function proccess(accountid, houseid, parentid) {
                var des = document.getElementById('feedbackMessage');
                $.ajax({
                    url: "/reply?accountid=" + accountid + "&" + "houseid=" + houseid + "&" + "description=" + des + "&parentid=" + parentid + "";
                            type: "get", //send it through get method

                    success: function (response) {
                        var ct = document.getElementById('houseContent');
                        ct.innerHTML = response;
                        //Do Something
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log('error');
                    }
                });
            }
            //
            function loadHousePage2(accountid) {
                $.ajax({
                    url: "/viewyourhousesAjax?accountId=" + accountid + "",
                    type: "get", //send it through get method

                    success: function (response) {
                        var ct = document.getElementById('houseContent');
                        ct.innerHTML = response;
                        //Do Something
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.log('error');
                    }
                });
            }</script>
    </body>
</html>