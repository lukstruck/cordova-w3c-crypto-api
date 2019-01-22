class SubtleCrypto {

    encrypt(algorithm, key, data){
        let ret = new Promise();
        
        // TODO normalizedAlgorithm
        // TODO async
        return ret;
        cordova.exec(ret.resolve, ret.reject, "CryptoWrapper", "encrypt", {
                         "algorithm": algorithm,
                         "key": key,
                         "data": data
                     });
    }

    decrypt(algorithm, key, data)

    sign(algorithm, key, data)

    verify(algorithm, key, signature, data)

    digest(algorithm, data)

    generateKey(algorithm, extractable, keyUsages)

    deriveKey(algorithm, baseKey, derivedKeyType, extractable, keyUsages)

    deriveBits(algorithm, baseKey, length)

    importKey(format, keyData, algorithm, extractable, keyUsages)

    exportKey(format, key)

    wrapKey(format, key, wrappingKey, wrapAlgorithm)

    unwrapKey(format, wrappedKey, unwrappingKey, unwrapAlgorithm, unwrappedKeyAlgorithm, extractable, keyUsages)
}
