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
    const editFileInput = document.getElementById('editFile-input');
    const editFileSvg = document.getElementById('editFileSvg')
    const editImagePreview = document.getElementById('editImage-preview');

    if(openModal){
      //クリックでモーダルを開く
      openModal.addEventListener("click", () => {
        modal.style.display = "flex";
        document.body.style.overflow = "hidden";
      });
      //モーダル背景を閉じるボタンとなる
      closeModal.addEventListener("click", () => {
        modal.style.display = "none";
        document.body.style.overflow = "";
      });

      modal.addEventListener("click", (e) => {
        // クリックされた要素がモーダルの背景部分であることを確認
        if (e.target === modal) {
          modal.style.display = "none";
          document.body.style.overflow = "";
        }
      });
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
      //PostEdit imageアップロード
      if(editFileInput){
        editFileInput.addEventListener('change', (e) => {
          const file = e.target.files[0];
          if (file) {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = (e) => {
              editImagePreview.src = e.target.result;
              editImagePreview.classList.remove('hidden');
              editFileSvg.classList.add('hidden')
            }
          } else {
            editImagePreview.classList.add('hidden');
            editFileSvg.classList.remove('hidden') 
          }  
        });
      }
    }
  }
  document.addEventListener("turbo:load", editModal);
})