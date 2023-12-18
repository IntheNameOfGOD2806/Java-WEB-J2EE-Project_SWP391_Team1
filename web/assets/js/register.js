/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById("userName").addEventListener("change", function () {
    $.ajax({
        url: "/register",
        type: "GET",
        data: {username: $("#userName").val()},
        success: function (response) {
            // Handle the success response.
            if (response === "exist") {
                $("#account-check-message").html("The account exists.");
                console.log("exist");
            } else {
                $("#account-check-message").html("");
                console.log("non-exist");
            }
        },
        error: function (error) {
            // Handle the error response.
            $("#account-check-message").html("An error occurred while checking the account.");
        }
    });
});

