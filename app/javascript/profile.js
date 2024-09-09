document.addEventListener('DOMContentLoaded', () => {
  const renderComponents = () => {
    const profileFileInput = document.getElementById('profile-file-input');
    const profileImagePreview = document.getElementById('profile-image-preview');
    const profileFileSvg = document.getElementById('profile-file-Svg');
    const openProfileModal = document.getElementById('openProfileModal')
    const closeProfileModal = document.getElementById('closeProfileModal')
    const profileModal = document.getElementById("profileModal");

    if (profileFileInput) {
      // imageアップロード
      profileFileInput.addEventListener('change', (e) => {
        const file = e.target.files[0];
        // ユーザーが選択したファイル（最初のファイル）を取得
        if (file) {
          const reader = new FileReader();
          // FileReaderオブジェクトはファイルの内容を非同期に読み取る
          reader.readAsDataURL(file);
          // fileオブジェクトを読込み、完了後 reader.onloadに定義した関数が実行される
          reader.onload = (e) => {
            // ファイルの読み込みが完了した時に実行される  
            profileImagePreview.src = e.target.result;
            // id="image-preview"で関連つけた<img>要素のsrcへ読み込んだ画像ファイルを格納
            profileImagePreview.classList.remove('hidden');
            profileFileSvg.classList.add('hidden');
            // classList.removeにより定義してあるclass: hiddenを削除する
          }
        } else {
          profileImagePreview.classList.add('hidden');
        }
      });
    }
    if (openProfileModal){
      openProfileModal.addEventListener("click", () => {
        profileModal.style.display = "flex";
        document.body.style.overflow = "hidden";
      });
      closeProfileModal.addEventListener("click", () => {
        profileModal.style.display = "none";
        document.body.style.overflow = "";
      });
    
      modal.addEventListener("click", (e) => {
        if (e.target === modal) {
          profileModal.style.display = "none";
          document.body.style.overflow = "";
        }
      });
    }
  }
  document.addEventListener('turbo:load', renderComponents);
});
