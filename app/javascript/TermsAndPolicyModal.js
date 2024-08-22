document.addEventListener('DOMContentLoaded', () => {
  const renderComponentTerms = () => {
    const openModalTerms = document.getElementById("openModalTerms");
    const closeModalTerms = document.getElementById("closeModalTerms");
    const modalTerms = document.getElementById("modalTerms");
    const openModalPolicy = document.getElementById("openModalPolicy");
    const closeModalPolicy = document.getElementById("closeModalPolicy");
    const modalPolicy = document.getElementById("modalPolicy");
    const footerBarOpenModalTerms = document.getElementById("footerBarOpenModalTerms");
    const footerBarCloseModalTerms = document.getElementById("footerBarCloseModalTerms");
    const footerBarModalTerms = document.getElementById("footerBarModalTerms");
    const footerBarOpenModalPolicy = document.getElementById('footerBarOpenModalPolicy');
    const footerBarCloseModalPolicy = document.getElementById("footerBarCloseModalPolicy");
    const footerBarModalPolicy = document.getElementById("footerBarModalPolicy");
    
    // top画面
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
      closeModalPolicy.addEventListener("click", () => {
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
    // login後 SMサイズ フッターバーメニュー
    if(footerBarOpenModalTerms){
      footerBarOpenModalTerms.addEventListener('click', () => {
        footerBarModalTerms.style.display = "flex";
        document.body.style.overflow = "hidden";
      })
      footerBarCloseModalTerms.addEventListener("click", () => {
        footerBarModalTerms.style.display = "none";
        document.body.style.overflow = "";
      });
      footerBarModalTerms.addEventListener("click", (e) => {
        if (e.target === footerBarModalTerms) {
          footerBarModalTerms.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }
    if(footerBarOpenModalPolicy){
      footerBarOpenModalPolicy.addEventListener('click', () => {
        footerBarModalPolicy.style.display = "flex";
        document.body.style.overflow = "hidden";
      })
      footerBarCloseModalPolicy.addEventListener("click", () => {
        footerBarModalPolicy.style.display = "none";
        document.body.style.overflow = "";
      });
      footerBarModalPolicy.addEventListener("click", (e) => {
        if (e.target === footerBarModalPolicy) {
          footerBarModalPolicy.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }
  }
  document.addEventListener('turbo:load', renderComponentTerms)
}) 