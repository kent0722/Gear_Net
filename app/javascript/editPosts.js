document.addEventListener('DOMContentLoaded', () => {
  const editModal = () => {
    const openModal = document.getElementById("openModal");
    const closeModal = document.getElementById("closeModal");
    const modal = document.getElementById("modal");

    const editBrandInput = document.getElementById('edit_brand');
    const nodeList = document.querySelectorAll('#edit_brand-list option')
    const editDatalistOptions = Array.from(nodeList).map(option => option.value);
    const editCategoryInput = document.getElementById('edit_category');
    const editInstrumentModelInput = document.getElementById('edit_instrument_model')
    
    // image_upload preview
    const editFileInput = document.getElementById('edit-file-input');
    const imagePreviews = document.getElementById('edit-previews');
    const editPostForm = document.getElementById('edit_post');
    if (!editPostForm) return;

    if(openModal){
      openModal.addEventListener("click", () => {
        modal.style.display = "flex";
        document.body.style.overflow = "hidden";
      });
      closeModal.addEventListener("click", () => {
        modal.style.display = "none";
        document.body.style.overflow = "";
      });

      modal.addEventListener("click", (e) => {
        if (e.target === modal) {
          modal.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }

    //brand 入力制限
    if(editBrandInput){
      editBrandInput.addEventListener('input', () => {
        const brandValue = editBrandInput.value;
        if (!editDatalistOptions.includes(brandValue)) {
          editBrandInput.value = '';
        }
      });
    }
    //category 入力補助
    if (editCategoryInput) {
      editCategoryInput.addEventListener('focus', () => { 
        editCategoryInput.setAttribute('placeholder', "例: Telecaster, Les paul, AZ(Ibanez)");
      });
      editCategoryInput.addEventListener('blur', () => {
        editCategoryInput.setAttribute('placeholder', ' ');
      });
    }
    //instrument_model 入力補助
    if (editInstrumentModelInput) {
    editInstrumentModelInput.addEventListener('focus', () => {
        editInstrumentModelInput.setAttribute('placeholder', '例: Vintage Model')
      })
      editInstrumentModelInput.addEventListener('blur', () => {
        editInstrumentModelInput.setAttribute('placeholder', '')
      })
    }

    /// PostEdit image_upload
    editFileInput.addEventListener('change', (e) => {
      const files = Array.from(e.target.files);
      const imageCount = imagePreviews.children.length;
      const totalImageCount = imageCount + files.length;

      if(totalImageCount > 6) {
        alert("投稿できる画像は6枚までです");
        e.target.value = ''; // ファイル選択をリセット
        return;
      }
    })

    const checkImageCount = () => {
      const imageCount = imagePreviews.children.length;
      if (imageCount >= 6) {
        editFileInput.disabled = true;
      } else {
        editFileInput.disabled = false;
      }
    }
    checkImageCount();
  }
  document.addEventListener("turbo:load", editModal);
})
