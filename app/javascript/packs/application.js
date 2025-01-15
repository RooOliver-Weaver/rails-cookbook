// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import { Turbo } from "@hotwired/turbo-rails"
document.addEventListener("DOMContentLoaded", function() {
  const dropdownButton = document.querySelector(".dropdown-button");
  const dropdownMenu = document.querySelector(".dropdown-menu");
  const dropdownOptions = document.querySelectorAll(".dropdown-option");
  const hiddenImageInput = document.querySelector("input[name='category[default_image]']");

  // Toggle the dropdown visibility
  dropdownButton.addEventListener("click", function() {
    dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none" : "block";
  });

  // When an image is selected, update the input and hide the dropdown
  dropdownOptions.forEach(option => {
    option.addEventListener("click", function() {
      const selectedImageUrl = option.getAttribute("data-image");
      const selectedImageName = option.getAttribute("data-name");

      // Update the hidden input field with the selected image URL
      hiddenImageInput.value = selectedImageUrl;

      // Optionally, update the button text or display the selected image
      dropdownButton.textContent = `Selected Image: ${selectedImageName}`;

      // Hide the dropdown after selection
      dropdownMenu.style.display = "none";
    });
  });

  // Close the dropdown if clicked outside
  document.addEventListener("click", function(event) {
    if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
      dropdownMenu.style.display = "none";
    }
  });
});
