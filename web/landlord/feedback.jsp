<%-- 
    Document   : feedback
    Created on : Oct 22, 2023, 11:18:53 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.Feedback, jakarta.servlet.http.HttpSession, java.util.Vector, dal.FeedbackDAO, dal.HouseDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<!DOCTYPE html>
<html>

    <head>
        <script>

            function proccess(accountid, houseid, parentid) {
                var des = document.getElementById('feedbackMessage'+parentid).value;
                $.ajax({
                    url: "/reply?accountid=" + accountid + "&houseid=" + houseid + "&description=" + des + "&parentid=" + parentid,
                    type: "get", // send it through the get method

                    success: function (response) {
                        var ct = document.getElementById('ff');
                        ct.innerHTML = response;
                        // Do Something
                    },
                    error: function (xhr) {
                        // Do Something to handle error
                        console.log('error');
                    }
                });
            }
            function proccess2(accountid, houseid) {
                var des = document.getElementById('fmsg').value;
                $.ajax({
                    url: "/createFeedBack?accountid=" + accountid + "&houseid=" + houseid + "&description=" + des,
                    type: "get", // send it through the get method

                    success: function (response) {
                        var ct = document.getElementById('ff');
                        ct.innerHTML = response;
                        // Do Something
                    },
                    error: function (xhr) {
                        // Do Something to handle error
                        console.log('error');
                    }
                });
            }
        </script>
        <style>
            .narrower-descendant {
                width: 60%; /* Adjust the width as needed */
            }
            .card-inner{
                margin-left: 4rem;
            }
        </style>

        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <%
       FeedbackDAO feedbackDAO1 = new FeedbackDAO();
               HouseDAO houseDAO = new HouseDAO();

    %>
    <body>



        <c:if test="${sessionScope.accountid eq null}">
            <h3 style="color:red;margin:auto">Login to view the feedback</h3>
        </c:if>
            <c:if test="${sessionScope.accountid != null}">
            <div class="container">
            
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#feedbackModal1">
                Press to feedback
            </button>
              

            <h2 class="text-center">FeedBack </h2>
            <c:if test="${requestScope.listFeedback!= null}">
                   <c:forEach var="feedback" items="${requestScope.listFeedback}">


                <%
                                                   Feedback f = (Feedback)pageContext.getAttribute("feedback");
                %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date feedbackCreateDate = f.getCreateDate1();
    Date currentDate = new Date();
    
    long timeDifferenceMillis = currentDate.getTime() - feedbackCreateDate.getTime();
    long daysDifference = TimeUnit.DAYS.convert(timeDifferenceMillis, TimeUnit.MILLISECONDS);

    String timeAgo;
    
    if (daysDifference == 0) {
        long hoursDifference = TimeUnit.HOURS.convert(timeDifferenceMillis, TimeUnit.MILLISECONDS);
        if (hoursDifference == 0) {
            long minutesDifference = TimeUnit.MINUTES.convert(timeDifferenceMillis, TimeUnit.MILLISECONDS);
            if (minutesDifference == 0) {
                long secondsDifference = TimeUnit.SECONDS.convert(timeDifferenceMillis, TimeUnit.MILLISECONDS);
                timeAgo = secondsDifference + " seconds ago";
            } else {
                timeAgo = minutesDifference + " minutes ago";
            }
        } else {
            timeAgo = hoursDifference + " hours ago";
        }
    } else {
        timeAgo = daysDifference + " days ago";
    }
%>



                <c:if test="${feedback.getParentId() == 0}">
                

                    <div class="card">
                        <div class="card-body">


                            <div class="row">
                                <div class="col-md-2">
                                    <c:set var="f" value="${feedback}" />
                                    <img src="<%=feedbackDAO1.getProfileByAccountId(f.getAccountId()).getPhoto()%>" class="img img-rounded img-fluid"/>
                                    <p class="text-secondary text-center"> <%= timeAgo  %></p>
                                </div>
                                <div class="col-md-10">
                                    <p>
                                        <a class="float-left" href="view_profile_other?aid=<%=f.getAccountId()%>"><strong><%=feedbackDAO1.getProfileByAccountId(f.getAccountId()).getFullName()%></strong></a>


                                    </p>
                                    <div class="clearfix"></div>
                                    <p> ${feedback.description}</p>
                                    <p>
                                        <a data-toggle="modal" data-target="#feedbackModal${feedback.getFeedbackId()}" class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> Reply</a>
                                    <div class="modal fade" id="feedbackModal${feedback.getFeedbackId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Phản hồi của bạn</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Reply to <%=feedbackDAO1.getProfileByAccountId(f.getAccountId()).getFullName()%>
                                                    <div class="form-group">
                                                        <label for="feedbackMessage">Nội dung phản hồi</label>
                                                        <textarea class="form-control" id="feedbackMessage${feedback.getFeedbackId()}" rows="4"></textarea>
                                                    </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                    <button data-dismiss="modal" onclick="proccess(${sessionScope.accountid}, ${f.getHouseId()}, ${f.getFeedbackId()})" type="button" class="btn btn-primary">Gửi phản hồi</button>

                                                </div>
                                            </div>
                                        </div>





                                    </div>
                                    </p>
                                </div>
                            </div>

                            <c:forEach var="descandant" items="<%=houseDAO.getDescandantFeedBacks(f.getFeedbackId())%>">
                                <%
                                                    Feedback d = (Feedback)pageContext.getAttribute("descandant");
                                %>
<%
    Date feedbackCreateDate1 = d.getCreateDate1();
    
    long timeDifferenceMillis1 = currentDate.getTime() - feedbackCreateDate1.getTime();
    long daysDifference1 = TimeUnit.DAYS.convert(timeDifferenceMillis1, TimeUnit.MILLISECONDS);

    String timeAgo1;
    
    if (daysDifference1 == 0) {
        long hoursDifference1 = TimeUnit.HOURS.convert(timeDifferenceMillis1, TimeUnit.MILLISECONDS);
        if (hoursDifference1 == 0) {
            long minutesDifference1 = TimeUnit.MINUTES.convert(timeDifferenceMillis1, TimeUnit.MILLISECONDS);
            if (minutesDifference1 == 0) {
                long secondsDifference1 = TimeUnit.SECONDS.convert(timeDifferenceMillis1, TimeUnit.MILLISECONDS);
                timeAgo1 = secondsDifference1 + " seconds ago";
            } else {
                timeAgo1 = minutesDifference1 + " minutes ago";
            }
        } else {
            timeAgo1 = hoursDifference1 + " hours ago";
        }
    } else {
        timeAgo1 = daysDifference1 + " days ago";
    }
%>

                                <div  class= "card card-inner ">
                                    <div class="card-body">
                                        <div style="width:80%" class="row">
                                            <div class="col-md-2">
                                                <img src="<%=feedbackDAO1.getProfileByAccountId(d.getAccountId()).getPhoto()%>" class="img img-rounded img-fluid"/>
                                                <p class="text-secondary text-center"><%=timeAgo1%></p>
                                            </div>
                                            <div class="col-md-10">
                                                <p><a href="view_profile_other?aid=<%=d.getAccountId()%>"><strong><%=feedbackDAO1.getProfileByAccountId(d.getAccountId()).getFullName()%></strong></a></p>
                                                <p>${descandant.description}</p>
                                                <p>


                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </c:forEach>




                        </div>
                    </div>


                </c:if>
            </c:forEach>
            </c:if>
              <div class="modal fade" id="feedbackModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Your responses</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label for="feedbackMessage">Content</label>
                                        <textarea class="form-control" id="fmsg" rows="4"></textarea>
                                    </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button data-dismiss="modal" onclick="proccess2(${sessionScope.accountid}, ${sessionScope.houseid})" type="button" class="btn btn-primary">Gửi phản hồi</button>

                                </div>
                            </div>
                        </div>
                        




                    </div>

         

        </div>
        </c:if>
  

    </body>
</html>
