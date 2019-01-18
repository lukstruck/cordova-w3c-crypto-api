class Crypto {
    getRandomValues(typedArray) {
        
    }

    subtle = new SubtleCrypto();
}

window.crypto = new Crypto();