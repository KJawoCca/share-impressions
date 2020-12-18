if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImagePreview = document.getElementById('image_preview');

    document.getElementById('opus_image').addEventListener('change', function(e){
      // ユーザーが投稿した画像のプレビューが表示されている場合、すでに存在している画像と説明文を削除する
      const imageContent = document.querySelector('img');
      const imageText = document.getElementById('image_text');
      const imageTitle = document.getElementById('image_title');
      if (imageContent){
        imageContent.remove();
        imageText.textContent = "";
        imageTitle.textContent = "";
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    });
  });
}