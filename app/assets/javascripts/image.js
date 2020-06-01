$(function(){
  //画像投稿ようのボタンを作成。numにはあとで数字が入る
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  //プレビューのhtml
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  //インデックス番号を作成
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  //投稿ボタンの最後のindexをとる
  lastIndex = $('.js-file_group:last').data('index');
  //fileindexからspliceで０と上で定義した最後のindexをとる
  fileIndex.splice(0, lastIndex);
  //checkboxを隠す
  $('.hidden-destroy').hide();

  //#image-boxの中の.js-fileが変わったら
  $('#image-box').on('change', '.js-file', function(e) {
    //該当の.js-fileの親要素のindexを取ってくる
    const targetIndex = $(this).parent().data('index');
    //event.target.filesの略。最初のファイルを取ってきている
    const file = e.target.files[0];
    //ファイルのurlを取ってくる
    const blobUrl = window.URL.createObjectURL(file);

    //もし取ってきたのが０番だったら、imgにsrcと言うnameとblobUrlと言うvalueを追加する
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { 
      //#previewには取ってきた数字とurlををいておく
      $('#previews').append(buildImg(targetIndex, blobUrl));
      //新規投稿のボタンを追加する
      $('#image-box').append(buildFileField(fileIndex[0]));
      //fileIndexの最初の文字を消す
      fileIndex.shift();
      //fileindexに最後の数字に1をたした数をいれる
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  //削除ボタンが押されたら
  $('#image-box').on('click', '.js-remove', function() {
        //該当の.js-removeの親要素のindexを取ってくる
    const targetIndex = $(this).parent().data('index');
    //上で取ってきた数字のinputボタンを隠すことを定義する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});