/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const minusButton = document.getElementById("button-addon1");
  const plusButton = document.getElementById("button-addon2");
  const quantityInput = document.querySelector(".input-group input");

  function updateQuantity(change) {
    const currentQuantity = parseFloat(quantityInput.value) || 0; // Handle initial NaN or empty value
    const newQuantity = Math.max(1, currentQuantity + change); // Ensure minimum of 1
    quantityInput.value = newQuantity;
  }

  minusButton.addEventListener("click", () => updateQuantity(-1));

  plusButton.addEventListener("click", () => updateQuantity(1));