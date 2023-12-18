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
        <title>edit House</title>

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
        

        <style>
            .container{
                width: 70%;
                height: 80%;
                
            }
        </style>
    </head>

    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
       
            <!--Main container start -->

            <button onclick="goBack()" class="btn btn-secondary">Back</button>

    
    
                <h1>Edit House </h1>
                <form  action="edithouse" method="post" enctype="multipart/form-data">
                    <!-- House Title -->
                    <div class="form-group">
                        <label for="housename">House Name</label>
                        <input type="text" class="form-control" id="houseTitle" name="housename" value="${requestScope.house.name}" required>
                    </div>
    
                    <!-- Description -->
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" required >${requestScope.house.getDescription()}</textarea>
                    </div>
    
                    <div class="form-group">
                        <label for="location">Numbers of Room </label>
                        <input type="number" class="form-control" id="location" name="roomnumbers" value="${requestScope.house.getNumberOfRoom()}" required>
                    </div>
                    <div class="form-group">
                        <label for="location">City:</label>
                        <input type="text" class="form-control" id="city" name="city"  value="${requestScope.house.city}" required>
                    </div>
                    <div style="display:none" class="form-group">
                        <label for="accountid">accountid</label>
                        <input type="number" class="form-control" id="city" name="accountid" value="${sessionScope.accountid}" required>
                    </div>
                    <div style="display:none" class="form-group">
                        <label for="accountid">houseid</label>
                        <input type="number" class="form-control" id="city" name="houseid" value="${house.getHouseID()}" required>
                    </div>
    
                    <!-- Location -->
                    <div class="form-group">
                        <label for="location">Address</label>
                        <input type="text" class="form-control" id="location" name="address" value="${requestScope.house.getAddress()}" required>
                    </div>
                    <label for="fruitSelect">Choose a Category</label>
                    <select id="categoryselect" name="category">
                        <option value="1">Chung Cư Mini</option>
                        <option value="2">Homestay</option>
                        <option value="3">Xóm trọ</option>
    
    
                    </select>
                    <label for="fruitSelect">Set status</label>
                    <select id="statusset" name="status">
                        <option value="1">For rent</option>
                        <option value="0">Not for rent</option>
    
                    </select>
                    <!-- Image Upload (for multiple images, you can use multiple file inputs) -->
                    <div class="form-group">
                        <label for="location">Electrical fee</label>
                        <input type="number" class="form-control" id="location" name="electricfee" value="${requestScope.house.getElectricalFee()}"  required>
                    </div>
                    <div class="form-group">
                        <label for="location">Water fee</label>
                        <input type="number" class="form-control" id="location" name="waterfee" value="${requestScope.house.getWaterFee()}" required>
                    </div>
    
                    <div class="form-group">
                        <label for="location">Photos Link(up to 4 photos)</label>
                                                <label style="color:red" for="location">If no photo selected,old images will remain</label>

                     <div class="form-item__input">
    
                        <input type="file" name="file1" >
    
                    </div>
                        <div class="form-item__input">
    
                        <input type="file" name="file2" >
    
                    </div>
                        <div class="form-item__input" >
    
                        <input type="file" name="file3" >
    
                    </div>
                        <div class="form-item__input">
    
                        <input type="file" name="file4" >
    
                    </div>
    
                    </div>
    
    
                    <button type="submit" class="btn btn-primary">Update House Information</button>
    
                </form>
            


        <div class="ttr-overlay"></div>

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
                    url: "/111/landlord/simpleCreateHouse.jsp",
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