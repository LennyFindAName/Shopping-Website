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


const imageInput2 = document.getElementById("cateADD");
const checkButton2 = document.getElementById("checkButton2");
const previewImage2= document.getElementById("previewImage2");
const errorMessage2 = document.getElementById("errorMessage2");
checkButton2.addEventListener("click", function () {
    const imageUrl = imageInput2.value.trim(); // Trim leading/trailing spaces

    if (!imageUrl || !imageUrl.match(/\.(jpg|jpeg|png|gif)$/i)) {
        errorMessage.textContent = "Please enter a valid image URL (JPG, JPEG, PNG, or GIF)";
        previewImage2.classList.remove("d-none"); // Show error message container
        previewImage2.classList.add("d-none"); // Hide preview image
        return;
    }
    errorMessage2.textContent = ""; 
    previewImage2.classList.remove("d-none"); 
    previewImage2.src = imageUrl; 
});