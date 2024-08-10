document.addEventListener('DOMContentLoaded', () => {
  const renderComponents = () => {
    const dropdownButton = document.getElementById('dropdownButton');
    const dropdownMenu = document.getElementById('dropdownMenu');
    const showDropdownButton = document.getElementById('showDropdownButton');
    const showDropdownMenu = document.getElementById('showDropdownMenu');
    const sideDropdownButton = document.getElementById('sideDropdownButton');
    const sideDropdownMenu = document.getElementById('sideDropdownMenu');

    //header
    if (dropdownButton){
      dropdownButton.addEventListener('click', (e) => {
        e.stopPropagation();
        dropdownMenu.classList.toggle('hidden');
      });
      document.addEventListener('click', (e) => {
        if (!dropdownButton.contains(e.target) && !dropdownMenu.contains(e.target)) {
          dropdownMenu.classList.add('hidden');
        }
      });
    }
    //show
    if (showDropdownButton){
      showDropdownButton.addEventListener('click', (event) => {
        event.stopPropagation();
        showDropdownMenu.classList.toggle('hidden');
      });
      document.addEventListener('click', (e) => {
        if (!showDropdownButton.contains(e.target) && !showDropdownMenu.contains(e.target)) {
          showDropdownMenu.classList.add('hidden');
        }
      });
    }
    // side
    if (sideDropdownButton){
      sideDropdownButton.addEventListener('click', (event) => {
        event.stopPropagation();
        sideDropdownMenu.classList.toggle('hidden');
      });
      document.addEventListener('click', (e) => {
        if (!sideDropdownButton.contains(e.target) && !sideDropdownMenu.contains(e.target)) {
          sideDropdownMenu.classList.add('hidden');
        }
      });
    }
  };
  document.addEventListener('turbo:load', renderComponents);
});
