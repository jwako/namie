/**
 * Created by workshop on 2014/06/07.
 */
$(function() {
    $('#store-image').click(function () {
//        var canvas = document.getElementById("their-video");
//        var png = canvas.toDataURL();
//        document.getElementById("storedImage").src = png;
        $('#storedImage').show();

        var cEle = document.getElementById('storedImage');
        var cCtx = cEle.getContext('2d');
        var vEle = document.getElementById('their-video');

        cEle.width  = vEle.videoWidth * 0.25;   // canvasの幅と高さを、動画の幅と高さに合わせる
        cEle.height = vEle.videoHeight * 0.25;

        cCtx.drawImage(vEle, 0, 0, cEle.width, cEle.height);  // canvasに関数実行時の動画のフレームを描画
    });
});
