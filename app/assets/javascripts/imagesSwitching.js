$(function () {
  $(".thumbnail-image").first().addClass("active"); // 1枚目の小画像をアクティブに変更
  $('.image-sub-photo').click(function () { // 小画像がクリックされたらイベント発火
    image_url = $(this).attr("src"); // クリックされた画像のPATHを取得
    $(".image-main-photo").attr("src", image_url).hide().fadeIn(); // メイン画像をクリックされた画像に変更
    $(".thumbnail-image.active").removeClass("active"); // 1枚目の小画像のアクティブを無効化
    $(this).parent().addClass("active"); // クリックされた小画像をアクティブに変更
  });
});