<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Profile,model.Account,dal.AccountDAO" %>

<html lang="en" >
    <head>
        <meta charset="utf-8">


        <title>Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
                margin-left: 200px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }

        </style>
    </head>
    <c:set var = "accountId" value = "${sessionScope.accountid}"/>
    <%
     int accountid = (int)pageContext.getAttribute("accountId"); 
     AccountDAO accountd = new AccountDAO();
     if(accountd.getRoleByAccountID(accountid) == 4){
    %>
    <jsp:include page="marketing/Header.jsp"></jsp:include>
    <%}if(accountd.getRoleByAccountID(accountid) == 3){%>
    <jsp:include page="landlord/Header.jsp"></jsp:include>
    <%}%>

    <body>
        <% 
Profile profile =(Profile)request.getAttribute("dataprofile");
        %>
        <div class="container" style="margin-top : 150px">
            <div class="main-body">


                <div class="row gutters-sm">


                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="<%=profile.getPhoto()%>"  id="uploadedPhoto" alt="Uploaded Image" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4><%=profile.getFullName()%></h4>
                                        <%if(accountd.getRoleByAccountID(accountid) == 4){%>
                                        <p class="text-secondary mb-1">Marketing Staff</p>
                                        <%}if(accountd.getRoleByAccountID(accountid) == 3){%>
                                        <p class="text-secondary mb-1">Landlord</p>
                                        <%}%>
                                        <input type="file" id="inputPhoto" class="col-12"/>
                                        <input type="hidden" id="imageInput" class="col-12"/>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-8">
                        <div class="card mb-3">
                            <form action="edit" method="post">
                                <input value="<%=profile.getPhoto()%>" id="Photo" name="Photo" type="hidden"/>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getFullName()%>" type="text" name="fullname" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getEmail()%>" type="text" name="email" required=""/>

                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getPhone()%>" type="text" name="phone" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Date Of Birth</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input value="<%=profile.getDOB()%>" type="date" name="DOB" required=""/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>

                                        <div class="col-sm-9 text-secondary">
                                            <%if(profile.getGender()==1){%>
                                              <input type="radio" id="html" name="gender" value="1" checked="">
                                              <label for="html">Male</label><br>
                                              <input type="radio" id="css" name="gender" value="0" />
                                              <label for="css">Female</label><br>
                                            <%}else{%>
                                              <input type="radio" id="html" name="gender" value="1" >
                                              <label for="html">Male</label><br>
                                              <input type="radio" id="css" name="gender" value="0" checked=""/>
                                              <label for="css">Female</label><br>
                                            <%}%>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <input type="submit" class="btn btn-success" value="Save" name="submit"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="row gutters-sm">

                        </div>
                    </div>


                </div>
            </div>
        </div>
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
        <script src="marketing/assets/js/uploadimage.js"></script>
        

    </body>
</html>