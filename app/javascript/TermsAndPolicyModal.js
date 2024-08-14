document.addEventListener('DOMContentLoaded', () => {
  const renderComponentTerms = () => {
    const openModalTerms = document.getElementById("openModalTerms");
    const closeModalTerms = document.getElementById("closeModalTerms");
    const modalTerms = document.getElementById("modalTerms");
    const openModalPolicy = document.getElementById("openModalPolicy");
    const closeModalPolicy = document.getElementById("closeModalPolicy");
    const modalPolicy = document.getElementById("modalPolicy");
    
    
    if(openModalTerms){
      openModalTerms.addEventListener('click', () => {
        modalTerms.style.display = "flex";
        document.body.style.overflow = "hidden";
      })
      closeModalTerms.addEventListener("click", () => {
        modalTerms.style.display = "none";
        document.body.style.overflow = "";
      });
      modalTerms.addEventListener("click", (e) => {
        if (e.target === modalTerms) {
          modalTerms.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }
    if(openModalPolicy){
      openModalPolicy.addEventListener('click', () => {
        modalPolicy.style.display = "flex";
        document.body.style.overflow = "hidden";
      })
      closeModalTerms.addEventListener("click", () => {
        modalPolicy.style.display = "none";
        document.body.style.overflow = "";
      });
      modalPolicy.addEventListener("click", (e) => {
        if (e.target === modalPolicy) {
          modalPolicy.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }
  }
  document.addEventListener('turbo:load', renderComponentTerms)
}) 