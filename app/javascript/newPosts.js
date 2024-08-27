document.addEventListener('DOMContentLoaded', () => {
  const renderComponents = () => {
    const brandInput = document.getElementById('brand');
    const nodeList = document.querySelectorAll('#brand-list option')
    const datalistOptions = Array.from(nodeList).map(option => option.value);
    const categoryInput = document.getElementById('category');
    const instrumentModelInput = document.getElementById('instrument_model')
    //image_upload
    const fileInput = document.getElementById('file-input');
    const fileSvg = document.getElementById('fileSvg')
    const placeholderText = document.getElementById('placeholder-text');
    const imagePreview = document.getElementById('image-preview');
    const form = fileInput.closest('form');
    //preview
    const postForm = document.getElementById('new_post');
    const previewList = document.getElementById('previews');
    if (!postForm) return null;

    //brand 入力制限
    if(brandInput){
      brandInput.addEventListener('input', () => {
        const brandValue = brandInput.value;
        if (!datalistOptions.includes(brandValue)) {
          brandInput.value = '';
        }
      });
    }
    //category 入力補助
    if (categoryInput) {
      categoryInput.addEventListener('focus', () => { 
        categoryInput.setAttribute('placeholder', "例: Telecaster, Les paul, AZ(Ibanez)");
      });
      categoryInput.addEventListener('blur', () => {
        categoryInput.setAttribute('placeholder', ' ');
      });
    }
    //instrument_model 入力補助
    if (instrumentModelInput) {
    instrumentModelInput.addEventListener('focus', () => {
        instrumentModelInput.setAttribute('placeholder', '例: Vintage Model')
      })
      instrumentModelInput.addEventListener('blur', () => {
        instrumentModelInput.setAttribute('placeholder', '')
      })
    }
    //PostNew image_upload
    if(fileInput){
      fileInput.addEventListener('change', (e) => {
        const files = Array.from(e.target.files);

        if(files.length > 6){
          alert("投稿できる画像は6枚までです");
          e.target.value = ''; // ファイル選択をリセット
          previewList.innerHTML = '';
          imagePreview.classList.add('hidden');
          fileSvg.classList.remove('hidden');
          placeholderText.classList.remove('hidden');
          return;
        }
        
        const file = files[0]
        if (file) {
          const reader = new FileReader();
          reader.readAsDataURL(file);
          reader.onload = (e) => {
            imagePreview.src = e.target.result;
            imagePreview.classList.remove('hidden');
            fileSvg.classList.add('hidden')
            placeholderText.classList.add('hidden');
          }
        } else {
          imagePreview.classList.add('hidden');
          fileSvg.classList.remove('hidden')
          placeholderText.classList.remove('hidden');
        }
        
        //preview    
        previewList.innerHTML = '';
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
            imagePreview.src = blob;
          });

          previewWrapper.appendChild(previewImage);
          previewList.appendChild(previewWrapper);
        });   
      });
      form.addEventListener('submit', (e) => {
        if (!fileInput.files.length) {
          e.preventDefault(); // フォームの送信を止める
          alert('画像ファイルを選択してください。');
        }
      });
    }  
  }
  document.addEventListener('turbo:load', renderComponents);
});
