const textarea = document.getElementById('text-input');
const charCount = document.getElementById('char-count');

textarea.addEventListener('input', () => {
  charCount.textContent = textarea.value.length;
});
