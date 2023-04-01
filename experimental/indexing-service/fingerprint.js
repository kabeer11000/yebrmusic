// const fpcalc = require("./chromaprint-bindings");
// fpcalc("./audio.mp3", function(err, result) {
//     if (err) throw err;
//     console.log(result.file, result.duration, result.fingerprint);
// });

// const fpcalc = require("chromaprint.js/bin/fpcalc");
// const fs = require("fs");
// const readableStream = fs.createReadStream("./audio.mp3");
//
// fpcalc.calculateFingerprint(readableStream, console.log);
// This will wait until we know the readable stream is actually valid before piping
// readableStream.on('open', function () {
//     This just pipes the read stream to the response object (which goes to the client)
    // readableStream.pipe(res);
// });