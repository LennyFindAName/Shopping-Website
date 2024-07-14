/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const imageInput = document.getElementById("image");
const checkButton = document.getElementById("checkButton");
const previewImage = document.getElementById("previewImage");
const errorMessage = document.getElementById("errorMessage");

checkButton.addEventListener("click", function () {
    const imageUrl = imageInput.value.trim(); // Trim leading/trailing spaces

    if (!imageUrl || !imageUrl.match(/\.(jpg|jpeg|png|gif)$/i)) {
        errorMessage.textContent = "Please enter a valid image URL (JPG, JPEG, PNG, or GIF)";
        previewImage.classList.remove("d-none"); // Show error message container
        previewImage.classList.add("d-none"); // Hide preview image
        return;
    }
    errorMessage.textContent = ""; 
    previewImage.classList.remove("d-none"); 
    previewImage.src = imageUrl; 
});

