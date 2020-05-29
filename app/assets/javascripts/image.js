$(document).on('turbolinks:load', function(){
  $(function(){

    //写真投稿した後の写真表示する枠
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <span class="edit_btn">編集</span>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    //ここからが投稿編集のjs
    if (window.location.href.match(/\/projects\/\d+\/edit/)){
    //新規投稿と同じようにプレビュー画面の大きさを撮ってきてラベルのcssを決めている
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0_9]/g,''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加している
      $('.preview-box').each(function(index, box){
        $(box.attr('id', `preview-box__${index}`));
      })
      //削除ボタンにidを追加する
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 5) {
        $('.label-content').hide();
      }
    }

    function setLabel() {
      //prevメソッドで.prev-contentを取り出して定義
      var prevContent = $('.label-content').prev();
      //大枠の620から.prev-contentの大きさを消す。replaceメソッドで数字のみ取り出す
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      //大枠のラベルのwidthを変更
      $('.label-content').css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値を取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //label-boxにidとオプションをつけ変える
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      //↓入力したファイルのオブジェクトを読み込む
      reader.readAsDataURL(file);
      //new FileReader.onloadはファイルが正常に読み込まれたら動くと言う意味
      reader.onload = function() {
        var image = this.result;
        // #preview-box__idは上で自分で定義したid
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          //したの三行はラベルの前に上で定義したHTMLを入れている
          var html = buildHTML(id);
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }

        //イメージを追加する処理
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        //上で定義したHTMLが何個かを取り出して、5個だったらプレビューボックスを消す
        var count = $('.preview-box').length;
        if (count == 5) { 
          $('.label-content').hide();
        }

        // 先ほど作ったdestroyのidがついていたらチェックを外す
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked, false');
        }

        setLabel();
        //5個以下だったらHTMLの個数のidをプレビューにつける
        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      //プレビューボックスが何個かを取り出した、その回数だけsetLabelをする
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      $(`#preview-box__${id}`).remove();
      //取り出したid番号の画像を削除

      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        //.val("")なので削除している
        $(`#item_images_attributes_${id}_image`).val("");
  
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
  
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }else {
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
    });
  });
})