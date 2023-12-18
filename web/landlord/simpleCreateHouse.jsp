<%-- 
    Document   : simpleCreateHouse
    Created on : Oct 9, 2023, 3:09:12 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ajax create house Page</title>
        <script>
            function  preview(input, imageId) {
                const [file] = input.files;
                if (file) {
                    var image = document.getElementById(imageId);
                    image.src = URL.createObjectURL(file);
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Create House </h1>
            <form  action="createhousetest" method="post" enctype="multipart/form-data">
                <!-- House Title -->
                <div class="form-group">
                    <label for="housename">House Name</label>
                    <input type="text" class="form-control" id="houseTitle" name="housename" placeholder="Enter House Name" required>
                </div>

                <!-- Description -->
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" placeholder="Enter Description" required></textarea>
                </div>

                <div class="form-group">
                    <label for="location">Numbers of Room </label>
                    <input type="number" class="form-control" id="location" name="roomnumbers" placeholder=" Enter Rooom numbers" required>
                </div>
                <div class="form-group">
                    <label for="location">City:</label>
                    <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" required>
                </div>
                <div style="display:none" class="form-group">
                    <label for="accountid">accountid</label>
                    <input type="text" class="form-control" id="city" name="accountid" value="${sessionScope.accountid}">
                </div>

                <!-- Location -->
                <div class="form-group">
                    <label for="location">Address</label>
                    <input type="text" class="form-control" id="location" name="address" placeholder="Enter Address" required>
                </div>
                <label for="fruitSelect">Choose a Category:</label>
                <select id="categoryselect" name="category">

<!--                    <option  value="1">Chung Cư Mini</option>
                    <option  value="2">Homestay</option>
                    <option  value="3">Xóm trọ</option>-->
                    

                            <c:forEach items="${requestScope.datacate}" var="c">
                                    <option  value="${c.getCategoryID()}">${c.getCategory()}</option>
                                </c:forEach>

                </select>
                <label for="fruitSelect">Set status</label>
                <select id="statusset" name="status">
                    <option value="1">For rent</option>
                    <option value="0">Not for rent</option>

                </select>
                <!-- Image Upload (for multiple images, you can use multiple file inputs) -->
                <div class="form-group">
                    <label for="location">Electrical fee</label>
                    <input type="number" class="form-control" id="location" name="electricfee" placeholder="Enter Electric fee" required>
                </div>
                <div class="form-group">
                    <label for="location">Water fee</label>
                    <input type="number" class="form-control" id="location" name="waterfee" placeholder="Enter Water fee" required>
                </div>

                <div class="form-group">
                    <label for="location">Photos Link(up to 4 photos)</label>
                    <div class="form-item__input">

                        <input type="file" name="file1" id="file1" onchange="preview('file1', 'blah1')" required>
                        <!--<img id="blah1" src="#" alt="your image" />-->


                    </div>
                    <div class="form-item__input">

                        <input type="file" name="file2" id="file2" onchange="preview('file2', 'blah2')" >
                        <!--<img id="blah2" src="#" alt="your image" />-->

                    </div>
                    <div class="form-item__input">

                        <input type="file" name="file3" id="file3" onchange="preview('file3', 'blah3')" >
                        <!--<img id="blah3" src="#" alt="your image" />-->

                    </div>
                    <div class="form-item__input">

                        <input type="file" name="file4" id="file4" onchange="preview('file4', 'blah4')" >
                        <!--<img id="blah4" src="#" alt="your image" />-->

                    </div>

                </div>

                <button type="submit" class="btn btn-primary">Create House Information</button>

            </form>
        </div>


    </body>
</html>
