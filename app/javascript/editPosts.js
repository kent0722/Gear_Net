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
    // image_upload
    const editFileInput = document.getElementById('edit-file-input');
    const editFileSvg = document.getElementById('edit-fileSvg');
    const editImagePreview = document.getElementById('edit-image-preview');
    // preview
    const editPostForm = document.getElementById('edit_post');
    const editPreviewList = document.getElementById('edit-previews');
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
    if(editFileInput){
      editFileInput.addEventListener('change', (e) => {
        const files = Array.from(e.target.files);

        if(files.length > 6) {
          alert("投稿できる画像は6枚までです");
          e.target.value = ''; // ファイル選択をリセット
          return;
        }

        const file = files[0]
        if (file) {
          const editReader = new FileReader();
          editReader.readAsDataURL(file);
          editReader.onload = (e) => {
            editImagePreview.src = e.target.result;
            editImagePreview.classList.remove('hidden');
            editFileSvg.classList.add('hidden');
          }
        } else {
          editImagePreview.classList.add('hidden');
          editFileSvg.classList.remove('hidden');
        }
        
        // preview
        editPreviewList.innerHTML = '';
        files.map((file) => {
          const blob = URL.createObjectURL(file);
          const previewWrapper = document.createElement('div');
          previewWrapper.setAttribute('class', 'preview flex-shrink-0 mx-1');

          const previewImage = document.createElement('img');
          previewImage.setAttribute('class', 'preview-image');
          previewImage.setAttribute('src', blob);
          previewImage.style.width = '70px';
          previewImage.style.height = '100px';
          previewImage.style.objectFit = 'cover';

          // 画像クリック時に label の imagePreview に表示
          previewImage.addEventListener('click', () => {
            editImagePreview.src = blob;
          });

          previewWrapper.appendChild(previewImage);
          editPreviewList.appendChild(previewWrapper);
        });     
      });
    }
  }
  document.addEventListener("turbo:load", editModal);
})
