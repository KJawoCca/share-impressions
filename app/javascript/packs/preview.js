if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImagePreview = document.getElementById('image_preview');

    document.getElementById('opus_image').addEventListener('change', function(e){
      // ユーザーが投稿した画像のプレビューが表示されている場合、すでに存在している画像と説明文を削除する
      const imageContent = document.querySelector('img');
      const imageTitle = document.getElementById('image_title');
      if (imageContent){
        imageContent.remove();
      }
      if (imageTitle){
        imageTitle.textContent = "";
      }
      // 選択された画像情報を取得しURLを生成する
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      // 画像表示のためのHTML要素を生成して反映させる
      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    });
  });
}