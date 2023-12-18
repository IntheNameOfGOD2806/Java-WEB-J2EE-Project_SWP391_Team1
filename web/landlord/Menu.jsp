<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewFeedback
    Created on : Sep 25, 2023, 5:15:22 AM
    Author     : huyht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from educhamp.themetrades.com/demo/landlord/feedback.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
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
            content="" />
        <meta
            property="og:description"
            content="" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no" />

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="#" type="image/x-icon" />
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="landlord/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title></title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.min.js"></script>
            <script src="assets/js/respond.min.js"></script>
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
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#"
                       ><img
                            alt=""
                            src="landlord/assets/images/logo_real.png"
                            width="122"
                            height="27"
                            /></a>
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul>
                        <li>
                            <a href="DashBoard" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-home"></i
                                    ></span>
                                <span class="ttr-label">Dashboard</span>
                            </a>
                        </li>
                     
                        <c:if test="${sessionScope.account.getRoleId()==3}">
                            <li>
                                <a  class="ttr-material-button">
                                    <span class="ttr-icon"
                                          ><i class="ti-calendar"></i
                                        ></span>
                                    <span class="ttr-label">Manage House</span>
                                    <span class="ttr-arrow-icon"
                                          ><i class="fa fa-angle-down"></i
                                        ></span>
                                </a>
                                <ul>
                                    <li>
                                        <a onclick="loadHousePage()"

                                           class="ttr-material-button"
                                           ><span  class="ttr-label"
                                                >Create House</span
                                            ></a
                                        >
                                    </li>
                                    <li>
                                        <a onclick="loadHousePage2(${sessionScope.accountid})"

                                           class="ttr-material-button"
                                           ><span  class="ttr-label"
                                                >View House</span
                                            ></a
                                        >
                                    </li>

                                </ul>
                            </li>
                            <!--request-->
                            <li>
                                <a  class="ttr-material-button">
                                    <span class="ttr-icon"
                                          ><i class="ti-calendar"></i
                                        ></span>
                                    <span class="ttr-label">Manage Request</span>
                                    <span class="ttr-arrow-icon"
                                          ><i class="fa fa-angle-down"></i
                                        ></span>
                                </a>
                                <ul>

                                    <li>
                                        <a onclick="loadRequest()"

                                           class="ttr-material-button"
                                           ><span  class="ttr-label"
                                                >View Request</span
                                            ></a
                                        >
                                    </li>
                                    <li>
                                        <a onclick="loadContract()"

                                           class="ttr-material-button"
                                           ><span  class="ttr-label"
                                                >View Contracts </span
                                            ></a
                                        >
                                    </li>

                                </ul>
                            </li>


                        </c:if>
                        <li>
                            <a href="#" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-calendar"></i
                                    ></span>
                                <span class="ttr-label">Manage Advertisement</span>
                                <span class="ttr-arrow-icon"
                                      ><i class="fa fa-angle-down"></i
                                    ></span>
                            </a>
                            <ul>
                                <li>
                                    <a
                                        onclick="createAdsAjax()"
                                        class="ttr-material-button"
                                        ><span class="ttr-label"
                                           >Add Ads</span
                                        ></a
                                    >
                                </li>
                                <li>
                                    <a
                                        onclick="loadAds()"
                                        class="ttr-material-button"
                                        ><span class="ttr-label"
                                           >List Ads</span
                                        ></a
                                    >
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="landlord-feedback" class="ttr-material-button">
                                <span class="ttr-icon"
                                      ><i class="ti-comments"></i
                                    ></span>
                                <span class="ttr-label">Feedback</span>
                            </a>
                        </li>
                        <li class="ttr-seperate"></li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->
        <div class="ttr-overlay"></div>
    
        <script>
                     function confirmDelete(houseid) {
        var confirmation = confirm("Are you sure you want to delete this house?");
        if (confirmation) {
            // If the user clicks "OK," proceed with the deletion
            window.location.href = "deletehouse?houseid=" + houseid;
        } else {
            // If the user clicks "Cancel," do nothing or provide feedback
            console.log("Room deletion canceled.");
        }
    }
               function deleteroomconfirm(roomID) {
        var confirmation = confirm("Are you sure you want to delete this room?");
        if (confirmation) {
            // If the user clicks "OK," proceed with the deletion
            window.location.href = "deleteroom?roomid=" + roomID;
        } else {
            // If the user clicks "Cancel," do nothing or provide feedback
            console.log("Room deletion canceled.");
        }
    }
                                function confirmEndContract(contractId) {
                                    if (confirm("Bạn có chắc muốn kết thúc hợp đồng này?")) {
                                        // If the user confirms, you can perform your action here.
                                        // For example, you can use AJAX to send a request to the server to end the contract.
                                        // Implement your code here.
                                        loadContractDeActive(contractId);
                                    }
                                }

                                function loadroom(houseid) {
                                    $.ajax({

                                        url: "viewroom?houseId=" + houseid,
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
                                function createroom(houseid) {
                                    $.ajax({

                                        url: "createroom?houseid=" + houseid,
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
                                $(document).ready(function () {
                                    $('#button1').click(function () {
                                        alert($('#time :selected').text());
                                    });
                                });

                                function alert(alert) {
                                    console.alert(alert);


                                }
                                function proccessRequestdeny(requestid) {
                                    $.ajax({

                                        url: "request-listAjax?service=decline&id=" + requestid,
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
                                function proccessRequestagree(requestid) {
                                    $.ajax({

                                        url: "request-listAjax?service=agree&id=" + requestid,
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
                                function loadFeedback() {
                                    $.ajax({

                                        url: "/landlord-feedbackAjax",
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
                                function loadContractDelete(contractid) {
                                    $.ajax({

                                        url: "Constract-listAjax?service=delete&id=" + contractid,
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
//            function loadContractDeActive(contractid) {
//                $.ajax({
//
//                    url: "constract-list?service=deActive&id=" + contractid,
//                    type: "get", //send it through get method
//
//                    success: function (response) {
//                        var ct = document.getElementById('houseContent');
//                        ct.innerHTML = response;
//                        //Do Something
//                    },
//                    error: function (xhr) {
//                        //Do Something to handle error
//                        console.log('error');
//                    }
//                });
//
//            }
                                function loadContractDeActive(contractid) {
                                    $.ajax({

                                        url: "Constract-listAjax?service=deActive&id=" + contractid,
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
                                function loadContractReActive(contractid) {
                                    $.ajax({

                                        url: "Constract-listAjax?service=reActive&id=" + contractid,
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
                                function edithouse(houseid) {
                                    $.ajax({

                                        url: "/edithouse?houseid=" + houseid,
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
                                function loadRequest() {
                                    $.ajax({

                                        url: "/request-listAjax",
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
                                function loadAds() {
                                    $.ajax({

                                        url: "/ListAdsLandLordAjax",
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
                                // Get a reference to the element
                                const element = document.getElementById("myElement");

// Set a timeout to hide the element after 3000 milliseconds (3 seconds)
                                const timeout = 3000;

                                setTimeout(function () {
                                    // Hide the element by setting its display property to "none"
                                    element.style.display = "none";
                                }, timeout);

                                function createAd(houseid) {
                                    const selectedTime = document.getElementById("time" + houseid).value;
                                    const url = "/CreateAdsLandLordAjax?houseID=" + houseid + "&time=" + selectedTime;
                                    console.log(url);
                                    $.ajax({

                                        url: "/CreateAdsLandLordAjax?houseID=" + houseid + "&time=" + selectedTime,
                                        type: "post", //send it through get method

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
//form
                                $(document).ready(function () {
                                    $("#submitButton").click(function () {
                                        // Lấy giá trị từ trường input
                                        var inputValue = $("#inputField").val();

                                        // Tạo đối tượng dữ liệu để gửi lên máy chủ
                                        var data = {
                                            inputField: inputValue
                                        };

                                        // Sử dụng AJAX để gửi biểu mẫu lên máy chủ
                                        $.ajax({
                                            type: "POST", // Loại yêu cầu (POST, GET, PUT, DELETE, vv.)
                                            url: "your_server_url_here", // Đường dẫn đến máy chủ xử lý yêu cầu
                                            data: data, // Dữ liệu gửi lên máy chủ
                                            success: function (response) {
                                                // Xử lý phản hồi từ máy chủ sau khi gửi biểu mẫu thành công
                                                console.log(response);
                                            },
                                            error: function (error) {
                                                // Xử lý lỗi nếu có lỗi xảy ra trong quá trình gửi biểu mẫu
                                                console.error(error);
                                            }
                                        });
                                    });
                                });

                                function loadHousePage() {
                                    $.ajax({
                                        url: "/createhousetest",
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
                                //load rooms
                                function loadRooms(houseid) {
                                    $.ajax({
                                        url: "/viewroom?houseId=" + houseid,
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
                                }
                                //
                                function createAdsAjax() {
                                    $.ajax({
                                        url: "/createAdsAjax",
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
                                function confirmRequest(action, requestid) {
                                    var confirmationMessage = action === 'approve' ? "Approve this request?" : "Decline this request?";
                                    if (confirm(confirmationMessage)) {
                                        if (action === 'approve') {
                                            proccessRequestagree(requestid);
                                        } else {
                                            proccessRequestdeny(requestid);
                                        }
                                    }
                                }
                                function loadContract() {
                                    $.ajax({

                                        url: "/Constract-listAjax",
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
                                function goDashBoard() {
                                    $.ajax({

                                        url: "/DashBoardAjax",
                                        type: "get", //send it through get method

                                        success: function (response) {
                                            var ct = document.getElementById('houseContent');
                                            ct.innerHTML = response;
                                            //Do Something
                                            displayGraph(); // Call the function after content is loaded
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                            console.log('error');
                                        }
                                    });

                                }
                                function submit(houseid) {

                                    var a = document.getElementById("house" + houseid);
                                    a.submit();
                                }
                                function editroom(roomid) {
                                    var apiUrl = "/editroom?roomid=" + roomid;

    console.log("API URL:", apiUrl);
                                    $.ajax({

                                        url: "/editroom?roomid="+roomid+"",
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
                                        function requesttenant() {
                                    $.ajax({

                                        url: "/request-tenant",
                                        type: "get", //send it through get method

                                        success: function (response) {
                                            var ct = document.getElementById('houseContent');
                                            ct.innerHTML = response;
                                            //Do Something
                                            displayGraph(); // Call the function after content is loaded
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                            console.log('error');
                                        }
                                    });

                                }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                displayGraph();
            });
            function displayGraph() {
                const month = ${profitmonth};
                Chart.defaults.global.defaultFontFamily = "rubik";
                Chart.defaults.global.defaultFontColor = '#999';
                Chart.defaults.global.defaultFontSize = '12';
                var ctx = document.getElementById('chart').getContext('2d');
                new Chart(ctx, {
                    type: 'line',
                    // The data for our dataset
                    data: {
                        labels: month,
                        // Information about the dataset
                        datasets: [{
                                label: "Views",
                                backgroundColor: 'rgba(0,0,0,0.05)',
                                borderColor: '#4c1864',
                                borderWidth: "3",
                                data: ${profitpm},
                                pointRadius: 4,
                                pointHoverRadius: 4,
                                pointHitRadius: 10,
                                pointBackgroundColor: "#fff",
                                pointHoverBackgroundColor: "#fff",
                                pointBorderWidth: "3"
                            }]
                    },
                    // Configuration options
                    options: {
                        layout: {
                            padding: 0
                        },
                        legend: {display: false},
                        title: {display: false},
                        scales: {
                            yAxes: [{
                                    scaleLabel: {
                                        display: false
                                    },
                                    gridLines: {
                                        borderDash: [6, 6],
                                        color: "#ebebeb",
                                        lineWidth: 1
                                    }
                                }],
                            xAxes: [{
                                    scaleLabel: {display: false},
                                    gridLines: {display: false}
                                }]
                        },

                        tooltips: {
                            backgroundColor: '#333',
                            titleFontSize: 12,
                            titleFontColor: '#fff',
                            bodyFontColor: '#fff',
                            bodyFontSize: 12,
                            displayColors: false,
                            xPadding: 10,
                            yPadding: 10,
                            intersect: false
                        }
                    }
                });
            }
            ;
        </script>
    </body>
    <script>
        $(document).ready(function () {
            navLinks: true;
        });
    </script>
</html>
