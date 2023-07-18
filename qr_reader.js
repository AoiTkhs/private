let video = document.createElement("video");
let canvasElement = document.getElementById("canvas");
let canvas = canvasElement.getContext("2d");
let loadingMessage = document.getElementById("loadingMessage");
let outputContainer = document.getElementById("output");
let outputMessage = document.getElementById("outputMessage");
let outputData = document.getElementById("outputData");
let textbox = document.getElementById("qr_text");

// 直線を描画するための関数
function drawLine(begin, end, color) {
    canvas.beginPath();
    canvas.moveTo(begin.x, begin.y);
    canvas.lineTo(end.x, end.y);
    canvas.lineWidth = 4;
    canvas.strokeStyle = color;
    canvas.stroke();
}

navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })
    // ユーザーデバイスのカメラにアクセスするためのメディアデバイスを取得

    .then(function (stream) {
        video.srcObject = stream;
        video.setAttribute("playsinline", true);
        // `playsinline`属性を設定することで、iOS Safariでビデオをインライン再生するよう指定（ビデオが全画面表示になることを防止）

        video.play();
        // カメラ映像の再生を開始します。

        requestAnimationFrame(tick);
        // フレームごとに指定されたコールバック関数を実行するようブラウザに要求。
        // これによってカメラの映像を連続的に読み取ることが可能に。
    });


function tick() {
    loadingMessage.innerText = "カメラの映像を読み込んでいます…"
    if (video.readyState === video.HAVE_ENOUGH_DATA) {
        loadingMessage.hidden = true;
        canvasElement.hidden = false;
        outputContainer.hidden = false;

        canvasElement.height = video.videoHeight;
        canvasElement.width = video.videoWidth;
        canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
        let imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
        let code = jsQR(imageData.data, imageData.width, imageData.height, {
            inversionAttempts: "dontInvert",
        });
        if (code) {
            // 検出したQRコードを赤線で囲む
            drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
            drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
            drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
            drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
            outputMessage.hidden = true;
            outputData.parentElement.hidden = false;
            outputData.innerText = code.data;
            textbox.value = code.data;
        } else {
            outputMessage.hidden = false;
            outputData.parentElement.hidden = true;
        }
    }
    requestAnimationFrame(tick);
}