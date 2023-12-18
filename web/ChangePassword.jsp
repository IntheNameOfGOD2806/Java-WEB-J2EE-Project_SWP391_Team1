<%-- 
    Document   : ChangePassword
    Created on : Oct 5, 2023, 3:30:26 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Profile,model.Account,dal.AccountDAO" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
    .pass_show{
        position: relative
    }

    .pass_show .ptxt {

        position: absolute;

        top: 50%;

        right: 10px;

        z-index: 1;

        color: #f36c01;

        margin-top: -10px;

        cursor: pointer;

        transition: .3s ease all;

    }

    .pass_show .ptxt:hover{
        color: #333333;
    }
</style>
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
    <div class="container">
        <div class="row">
            <div class="col-sm-4" style="    margin: auto;
                 margin-top: 200px;">
                <form action="change" method="post">
                    <h3>Change Password Form</h3>
                    <h5 style="color: red">${requestScope.ms}</h5>
                <h5 style="color: red">${requestScope.re}</h5>
                <label>Current Password </label>
                <div class="form-group pass_show"> 
                    <input  name="oldpassword" type="password" class="form-control" placeholder="Current Password"> 
                </div>
                <input type="hidden" name="username" value="${sessionScope.name}"/>
                <label>New Password</label>
                <div class="form-group pass_show"> 
                    <input name="newpassword" type="password" class="form-control" placeholder="New Password"> 
                </div> 
                <label>Confirm Password</label>
                <div class="form-group pass_show"> 
                    <input name="repassword" type="password" class="form-control" placeholder="Confirm Password"> 
                </div>
                <input class="btn btn-default" type="submit" value="Change"/>
                <h5 style="color: red">${requestScope.sucess}</h5>

            </form>
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
<script>
    $(document).ready(function () {
        $('.pass_show').append('<span class="ptxt">Show</span>');
    });
    $(document).on('click', '.pass_show .ptxt', function () {

        $(this).text($(this).text() == "Show" ? "Hide" : "Show");
        $(this).prev().attr('type', function (index, attr) {
            return attr == 'password' ? 'text' : 'password';
        });
    });
</script>

