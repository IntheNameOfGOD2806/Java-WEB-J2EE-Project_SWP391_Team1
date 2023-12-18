/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global editor */

document.addEventListener("DOMContentLoaded", function () {
    const imageInput = document.getElementById("imageInput");
    const inputphoto = document.getElementById("inputPhoto");
    const photo = document.getElementById("Photo");
    const showphoto = document.getElementById("uploadedPhoto");
    imageInput.addEventListener("change", function () {
        const file = imageInput.files[0];
        const formData = new FormData();
        formData.append("image", file);
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/UploadImage", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.status === "success") {
                        const data = editor.getData();
                        const img = document.createElement('img');
                        img.src = response.url;
                        const imgString = img.outerHTML;
                        editor.setData(data + imgString);
                    }
                }
            }
        };
        xhr.send(formData);
    });
    inputphoto.addEventListener("change", function () {
        const file = inputphoto.files[0];
        const formData = new FormData();
        formData.append("image", file);
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/UploadImage", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.status === "success") {
                        photo.value = response.url;
                        showphoto.src = response.url;
                        console.log(response.url);
                    }
                }
            }
        };
        xhr.send(formData);
    });
});


