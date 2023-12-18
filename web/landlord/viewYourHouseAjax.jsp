<%-- 
    Document   : viewYourHouse
    Created on : Oct 3, 2023, 11:22:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from educhamp.themetrades.com/demo/admin/feedback.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
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
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>View House</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!--[if lt IE 9]>
            <script src="landlord/assets/js/html5shiv.min.js"></script>
            <script src="landlord/assets/js/respond.min.js"></script>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        


    </head>

    <body class="">
       
            <!--Main container start -->

            
            
                    <div class="container-fluid">
                        <div class="db-breadcrumb">
                            <h4 class="breadcrumb-title">View List Houses</h4>
                            <ul class="db-breadcrumb-list">
                                <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                                <li>View List Houses</li>
                            </ul>
                        </div>	
                        <div class="row">
                            <!-- Your Profile Views Chart -->
                            <div class="col-lg-12 m-b30">
                                <div class="widget-box">
                                    <div class="wc-title">
                                        <h4>Your Houses</h4>
                                    </div>
                                    <!--<a href="createhousetest?accountid=${sessionScope.accountid}" class="btn red radius-x3 outline">Create House</a>-->
                                <a onclick="loadHousePage()"class="btn red radius-x3 outline">Create House</a>


                                <c:forEach var="house" items="${requestScope.listHouse}">
                                    <div class="widget-inner">
                                        <div class="card-courses-list admin-courses">
                                            <div class="card-courses-media">
                                                <a href="viewhouse?houseId=${house.getHouseID()}">
                                                    <img src="${house.getPreviewImage().getImagePath()}" alt=""/>
                                                </a>
                                            </div>
                                            <div class="card-courses-full-dec">
                                                <div class="card-courses-title">
                                                    <h4> ${house.name}</h4>
                                                </div>
                                                <div class="card-courses-list-bx">
                                                    <ul class="card-courses-view">
                                                        <li class="card-courses-user">
                                                            <div class="card-courses-user-pic">
                                                                <img src="${requestScope.profile.getPhoto()}" alt=""/>
                                                            </div>
                                                            <div class="card-courses-user-info">
                                                                <h5>LandLord</h5>
                                                                <h4>${requestScope.profile.getFullName()}</h4>
                                                            </div>
                                                        </li>
                                                        <li class="card-courses-categories">
                                                            <h5>City</h5>
                                                            <h4>${house.city}</h4>
                                                        </li>
                                                        <li class="card-courses-categories">
                                                            <h5>Address</h5>
                                                            <h4 class="text-primary">${house.address}</h4>
                                                        </li>

                                                        <li class="card-courses-stats">
                                                            <a href="#" class="btn button-sm green radius-xl">${house.getStatus()}</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                                <div class="row card-courses-dec">
                                                    <div class="col-md-12">
                                                        <h6 class="m-b10">House Description</h6>
                                                        <p> ${house. getDescription()} </p>	
                                                    </div>
                                                    <div class="col-md-12">
                                                        <a id="editbox" onclick="edithouse(${house.getHouseID()})"   class="btn green radius-xl outline">Edit House</a>

                                                        <a onclick="loadroom(${house.getHouseID()})"  class="btn green radius-xl outline">View Room</a>
                                                        <a onclick="createroom(${house.getHouseID()})"  class="btn green radius-xl outline">Create Room</a>
                                                        <a onclick="confirmDelete(${house.getHouseID()})" class="btn red outline radius-xl">Delete House</a>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div style="display:none"  id="editbox" >
                                        <div class="container">
                                            <h1>Edit House </h1>
                                            <form  action="edithouse" method="post" enctype="multipart/form-data">
                                                <!-- House Title -->
                                                <div class="form-group">
                                                    <label for="housename">House Name</label>
                                                    <input type="text" class="form-control" id="houseTitle" name="housename" value="${requestScope.house.name}">
                                                </div>

                                                <!-- Description -->
                                                <div class="form-group">
                                                    <label for="description">Description</label>
                                                    <textarea class="form-control" id="description" name="description" value="${requestScope.house.description}" ></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <label for="location">Numbers of Room </label>
                                                    <input type="number" class="form-control" id="location" name="roomnumbers" value="${requestScope.house.getNumberOfRoom()}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="location">City:</label>
                                                    <input type="text" class="form-control" id="city" name="city"  value="${requestScope.house.city}" >
                                                </div>
                                                <div style="display:none" class="form-group">
                                                    <label for="accountid">accountid</label>
                                                    <input type="text" class="form-control" id="city" name="accountid" value="${sessionScope.accountid}">
                                                </div>
                                                <div style="display:none" class="form-group">
                                                    <label for="accountid">houseid</label>
                                                    <input type="text" class="form-control" id="city" name="houseid" value="${house.getHouseID()}">
                                                </div>

                                                <!-- Location -->
                                                <div class="form-group">
                                                    <label for="location">Address</label>
                                                    <input type="text" class="form-control" id="location" name="address" value="${requestScope.house.getAddress()}" >
                                                </div>
                                                <label for="fruitSelect">Choose a Category</label>
                                                <select id="categoryselect" name="category">
                                                    <option value="1">High Cost</option>
                                                    <option value="2">Cheap</option>

                                                </select>
                                                <label for="fruitSelect">Set status</label>
                                                <select id="statusset" name="status">
                                                    <option value="1">For rent</option>
                                                    <option value="0">Not for rent</option>

                                                </select>
                                                <!-- Image Upload (for multiple images, you can use multiple file inputs) -->
                                                <div class="form-group">
                                                    <label for="location">Electrical fee</label>
                                                    <input type="number" class="form-control" id="location" name="electricfee" value="${requestScope.house.getElectricalFee()}" >
                                                </div>
                                                <div class="form-group">
                                                    <label for="location">Water fee</label>
                                                    <input type="number" class="form-control" id="location" name="waterfee" value="${requestScope.house.getWaterFee()}">
                                                </div>

                                                <div class="form-group">
                                                    <label for="location">Photos Link(up to 4 photos)</label>
                                                    <div class="form-item__input">

                                                        <input type="file" name="file1">

                                                    </div>
                                                    <div class="form-item__input">

                                                        <input type="file" name="file2">

                                                    </div>
                                                    <div class="form-item__input">

                                                        <input type="file" name="file3">

                                                    </div>
                                                    <div class="form-item__input">

                                                        <input type="file" name="file4">

                                                    </div>

                                                </div>

                                                <button type="submit" class="btn btn-primary">Update House Information</button>

                                            </form>
                                        </div>

                                    </div>

                                </c:forEach>

                            </div>
                        </div>
                        <!-- Your Profile Views Chart END-->
                    </div>
                </div>
           


        <!--</main>-->


       

        <!-- External JavaScripts -->
<script>
    var editboxVisible = false; // Variable to track the editbox visibility

    function loadEditBox() {
        // Check the current visibility state and toggle it
        if (editboxVisible) {
            document.getElementById('editbox').style.display = 'none';
        } else {
            document.getElementById('editbox').style.display = 'block';
        }

        // Update the visibility state
        editboxVisible = !editboxVisible;
    }
</script>


        <script>

            function loadHousePage() {
                $.ajax({
                    url: "/landlord/simpleCreateHouse.jsp",
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
        </script>


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
        <script src='landlord/assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="landlord/assets/js/functions.js"></script>
        <script src="landlord/assets/vendors/chart/chart.min.js"></script>
        <script src="landlord/assets/js/admin.js"></script>
        <script src='landlord/assets/vendors/switcher/switcher.js'></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>