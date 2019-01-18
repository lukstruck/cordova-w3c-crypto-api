cordova.define("w3c-crypto-api.crypto", function(require, exports, module) {
class Crypto {
    getRandomValues(typedArray) {
        
    }

    subtle = new SubtleCrypto();
}

window.crypto = new Crypto();
});
