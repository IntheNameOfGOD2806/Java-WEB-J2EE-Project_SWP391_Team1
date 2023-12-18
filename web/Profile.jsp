<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account,model.Profile,dal.AccountDAO" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
Account account =(Account)request.getAttribute("dataaccount");
Profile profile =(Profile)request.getAttribute("dataprofile");
        %>
        <div class="container" style="margin-top : 150px">
            <div class="main-body">
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="<%=profile.getPhoto()%>" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4><%=profile.getFullName()%></h4>
                                        <%if(accountd.getRoleByAccountID(accountid) == 4){%>
                                        <p class="text-dark mb-1 fw-bold">Marketing Staff</p>
                                        <%}if(accountd.getRoleByAccountID(accountid) == 3){%>
                                        <p class="text-dark mb-1 fw-bold">Landlord</p>
                                        <p><a class="btn btn-info" id="vnpay-link-id" href="/VNPay">Recharge</a></p>
                                        <%}%>
                                        <p class="text-muted font-size-sm">Balance: <fmt:formatNumber value = "<%=account.getBalance()%>" type = "number"/> VND</p>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=profile.getFullName()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=profile.getEmail()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=profile.getPhone()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Date Of Birth</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=profile.getDOB()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%if (profile.getGender() == 1) {%>
                                        Male
                                        <%}%>
                                        <%if (profile.getGender() == 0) {%>
                                        Female
                                        <%}%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a class="btn btn-info " href="profile?go=edit">Edit</a>
                                        <a class="btn btn-info " href="change-password">Change Password</a>
                                        <c:if test="${roleid eq '2'}">
                                            <a class="btn btn-info " href="contract-tenant">View Contract</a>
                                            <a class="btn btn-info " href="request-tenant">View Request</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
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
    </body>
</html>