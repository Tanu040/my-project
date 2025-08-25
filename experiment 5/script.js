// Get dropdown and product list elements
const categoryDropdown = document.getElementById('category');
const products = document.querySelectorAll('#product-list li');

// Event listener for dropdown change
categoryDropdown.addEventListener('change', function () {
  const selectedCategory = categoryDropdown.value;

  products.forEach(product => {
    // Show all if 'all' is selected OR match category
    if (selectedCategory === 'all' || product.dataset.category === selectedCategory) {
      product.style.display = 'block';
    } else {
      product.style.display = 'none';
    }
  });
});
