document.addEventListener('DOMContentLoaded', () => {
  const renderSearchForm = () => {
    const openSearchButton = document.getElementById('openSearchButton');
    const slideMenu = document.getElementById('slideMenu');
    const autoInput = document.getElementById('auto-input');

    if (openSearchButton) {
      openSearchButton.addEventListener('click', (e) => {
        e.stopPropagation();
        slideMenu.classList.toggle('-translate-x-full');
        slideMenu.classList.toggle('translate-x-0');
      });
      document.addEventListener('click', (e) => {
        if (!openSearchButton.contains(e.target) && !slideMenu.contains(e.target)) {
          slideMenu.classList.add('-translate-x-full');
          slideMenu.classList.remove('translate-x-0');
        }
      });
    }
    if (autoInput) {
      autoInput.addEventListener('click', (e) => {
        e.stopPropagation();
      });
    }
  };
  document.addEventListener('turbo:load', renderSearchForm);
});