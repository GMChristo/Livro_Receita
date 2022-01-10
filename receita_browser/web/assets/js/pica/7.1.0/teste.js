

var img = new Image();
img.src = imageEncoded;
img.onload = function () {
    resize();
};

var pica = window.pica({
    js: true,
    wasm: true,
    cib: true,
    ww: true
});

var resize = function () {
    var src = document.querySelector('#src');
    src.width = img.width;
    src.height = img.height;
    var ctx = src.getContext("2d");
    ctx.drawImage(img, 0, 0);

    var width = 250; var alpha = true;

    var dst = document.querySelector('#dst');
    dst.width = width;
    dst.height = img.height * width / img.width;

    var offScreenCanvas = document.createElement('canvas')
    offScreenCanvas.width = dst.width;
    offScreenCanvas.height = dst.height;


    pica.resize(src, offScreenCanvas, {
        quality: 1,
        transferable: true,
        alpha: alpha
    }).then(function (result) {
        // Copy buffer to visible element
        dst.getContext('2d', { alpha: Boolean(alpha) }).drawImage(offScreenCanvas, 0, 0);

        var blob = pica.toBlob(result, 'image/jpeg', 0.90);
        console.log(blob);

    });;
};
