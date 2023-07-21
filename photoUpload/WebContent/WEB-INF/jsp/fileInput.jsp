<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 	<title>画像選択</title>
 	<meta name="viewport" content="width=device-width,initial-scale=1.0">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.0/dropzone.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.0/dropzone.css" />
	<link rel="stylesheet" href="css/album.css">
	<!-- Bootstrap CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
	<!-- アイコン -->
	 <script src="https://kit.fontawesome.com/b0a477e877.js" crossorigin="anonymous"></script>
	<!--============== レイアウトを制御するCSS ===============-->
	<link rel="stylesheet" type="text/css" href="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/reset.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.10.0/css/lightbox.min.css" />
	<link rel="stylesheet" type="text/css" href="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-2-1/css/6-2-1.css">
</head>

<body>


<!-- 画面表示部分------------------------------------------ -->
  <div id="dropzone">
    <form action="UploadServlet" class="dropzone" id="my-awesome-dropzone">
      <div class="dz-default dz-message upload_content">
        <button class="dz-button" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" height="5em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#d6d6d6}</style><path d="M144 480C64.5 480 0 415.5 0 336c0-62.8 40.2-116.2 96.2-135.9c-.1-2.7-.2-5.4-.2-8.1c0-88.4 71.6-160 160-160c59.3 0 111 32.2 138.7 80.2C409.9 102 428.3 96 448 96c53 0 96 43 96 96c0 12.2-2.3 23.8-6.4 34.6C596 238.4 640 290.1 640 352c0 70.7-57.3 128-128 128H144zm79-217c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l39-39V392c0 13.3 10.7 24 24 24s24-10.7 24-24V257.9l39 39c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-80-80c-9.4-9.4-24.6-9.4-33.9 0l-80 80z"/></svg>
          <div class="upload_text">クリックまたはファイルをドロップ</div>
      </button>
      </div>
      <div class="fallback">
        <input name="file" type="file" multiple />
        <input type="hidden" name="pageId" value="LAONE" />
      </div>
    </form>
  </div>

  <div class="wrapper">
    <ul class="gallery">
      <!-- ループして全部の画像を表示する -->
      <c:forEach var="e" items="${imageDataListString}" >
      <%-- 画像表示 --%>
        <!-- <img src="data:image/jpeg;base64,${e}" alt="Image"> -->
        <li>
          <a href="data:image/jpeg;base64,${e}" data-lightbox="gallery1" data-title="グループ1キャプション">
            <img src="data:image/jpeg;base64,${e}" alt="">
          </a>
        </li>
      </c:forEach>
    </ul>
  </div>

<!-- ------------------------------------------------------ -->


  <!-- Bootstrapのモーダル -->
  <div class="modal" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">以下の写真をアップロードします</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="modal-body">
          <!-- 画像のプレビューとチェックボックスがここに追加される-->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="uploadButton">Upload</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeButton">Close</button>
        </div>
      </div>
    </div>
  </div>

  <script src="js/upload.js"></script>
  <!-- Bootstrapのjs -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.10.0/js/lightbox.min.js"></script>
	<script src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-2-1/js/6-2-1.js"></script>
</body>
</html>
