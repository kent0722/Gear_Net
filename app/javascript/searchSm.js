document.addEventListener('DOMContentLoaded', () => {
  const renderSearchSmForm = () => {
    const openSmSearchButton = document.getElementById('openSearchSmButton');
    const slideSmMenu = document.getElementById('slideSmMenu');
    const autoSmInput = document.getElementById('auto-sm-input')

    if(openSearchSmButton){
      openSearchSmButton.addEventListener('click', (e) => {
      e.stopPropagation();
      slideSmMenu.classList.toggle('-translate-y-full');
      slideSmMenu.classList.toggle('translate-y-0');
      });
      document.addEventListener('click', (e) => {
        if (!openSearchSmButton.contains(e.target) && !slideSmMenu.contains(e.target)) {
          slideSmMenu.classList.add('-translate-y-full');
          slideSmMenu.classList.remove('translate-y-0');
        }
      });
    }
    if(autoSmInput){
      autoSmInput.addEventListener('click', (e) => {
        e.stopPropagation();
      })
    }
  }
  document.addEventListener('turbo:load', renderSearchSmForm);
});