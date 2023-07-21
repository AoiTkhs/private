Dropzone.options.myAwesomeDropzone = {
    paramName: "file",
    maxFilesize: 2, // MB
    dictDefaultMessage: 'ここにファイルをドラッグ＆ドロップしてください',
    parallelUploads: 1,
    uploadMultiple: true,
    autoProcessQueue: false,
    init: function() {
      var submitButton = document.querySelector("#uploadButton");
      var myDropzone = this;

      submitButton.addEventListener("click", function() {
        // Confirm the upload
        if(!confirm("画像をアップロードしますか？")) {
          return;
        }

        // チェックされたファイルだけを取得する
        var checkedFiles = myDropzone.files.filter(function(file) {
          return file.checkbox.checked;
        });
        // チェックしたファイルのみをアップロード
        myDropzone.processFiles(checkedFiles);

        if(checkedFiles.length > 0) {
            // Hide the modal if there is at least one checked file
            $("#myModal").modal('hide');
        }
      });

      this.on("addedfile", function(file) {
        // 画像プレビューとチェックボックスを作成
        var imagePreview = Dropzone.createElement("<img src='" + URL.createObjectURL(file) + "' width='100'>");
        var checkbox = Dropzone.createElement("<input type='checkbox' class='image-checkbox' style='display: none;' checked>");
        file.checkbox = checkbox;

        // モーダルにプレビューとチェックボックスを追加
        var previewContainer = document.createElement("div");
        previewContainer.style.position = "relative";

        previewContainer.appendChild(imagePreview);
        previewContainer.appendChild(checkbox);

        document.getElementById("modal-body").appendChild(previewContainer);

        // モーダルを表示する
        $("#myModal").modal('show');

        // モーダル閉じたら選んでた画像がクリアされる
        $("#myModal").on('hidden.bs.modal', function (e) {
          myDropzone.removeAllFiles();
          document.getElementById("modal-body").innerHTML = '';
        });
      });

      this.on("complete", function() {
        if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
          //登録が完了したあとに飛ばすServlet（doGetが動くよ）
          window.location.href = "/DDImageUpload/UploadServlet?result=1";
        }
      });
    }
  };

  // 閉じるボタン押されたら
  document.querySelector("#closeButton").addEventListener("click", function() {
    document.querySelector("#modal-body").innerHTML = ''; // ここで消す
  });