class SubtleCrypto: PSubtleCrypto {

    func encrypt(algorithm: AlgorithmIdentifier, key: CryptoKey, data: inout Data) throws -> Any {
        data = try CC.crypt(.encrypt, blockMode: .cbc, algorithm: .aes,
                 padding: .pkcs7Padding, data: data, key: key.key, iv: algorithm.iv!)
        return ERR_SUCCESS
    }

    func decrypt(algorithm: AlgorithmIdentifier, key: CryptoKey, data: inout Data) throws -> Any {
        data = try CC.crypt(.decrypt, blockMode: .cbc, algorithm: .aes,
                     padding: .pkcs7Padding, data: data, key: key.key, iv: algorithm.iv!)
        return ERR_SUCCESS
    }

    func sign(algorithm: AlgorithmIdentifier, key: CryptoKey, data: [Int]) -> Any {
        abort()
    }

    func verify(algorithm: AlgorithmIdentifier, key: CryptoKey, signature: [Int], data: [Int]) -> Any {
        abort()
    }

    func digest(algorithm: AlgorithmIdentifier, data: [Int]) -> Any {
        abort()
    }

    func generateKey(algorithm: AlgorithmIdentifier, extractable: Bool, keyUsages: [KeyUsage]) -> Any {
        abort()
    }

    func deriveKey(algorithm: AlgorithmIdentifier, baseKey: CryptoKey,
                   derivedKeyType: AlgorithmIdentifier, extractable: Bool, keyUsages: [KeyUsage]) -> Any {
        abort()
    }

    func deriveBits(algorithm: AlgorithmIdentifier, baseKey: CryptoKey, length: Int) -> [Int] {
        abort()
    }

    func importKey(format: KeyFormat, keyData: [Int], algorithm: AlgorithmIdentifier,
                   extractable: Bool, keyUsages: [KeyUsage]) -> CryptoKey {
        abort()
    }

    func exportKey(format: KeyFormat, key: CryptoKey) -> Any {
        abort()
    }

    func wrapKey(format: KeyFormat, key: CryptoKey, wrappingKey: CryptoKey,
                 wrapAlgorithm: AlgorithmIdentifier) -> Any {
        abort()
    }

    func unwrapKey(format: KeyFormat, wrappedKey: [Int], unwrappingKey: CryptoKey,
                   unwrapAlgorithm: AlgorithmIdentifier, unwrappedKeyAlgorithm: AlgorithmIdentifier,
                   extractable: Bool, keyUsages: [KeyUsage]) -> CryptoKey {
        abort()
    }

}
