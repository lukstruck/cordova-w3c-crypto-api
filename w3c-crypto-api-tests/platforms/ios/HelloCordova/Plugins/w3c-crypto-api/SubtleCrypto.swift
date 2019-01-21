class SubtleCrypto: PSubtleCrypto {
    
    private var encryptDecryptEngine: EncryptDecryptEngine
    private var signVerifyEngine: SignVerifyEngine
    private var digestEngine: DigestEngine
    private var keyEngine: KeyEngine

    init(){
        
    }
    
    func encrypt(algorithm: AlgorithmIdentifier, key: CryptoKey, data: inout Data) -> Any {
        var ret: Any = ERR_SUCCESS
        do {
            ret = try self.encryptDecryptEngine.encrypt(algorithm, key, &data)
        } catch CryptoError.invalidAccessError(let field){
            ret = field.data
        }
        return ret
    }

    func decrypt(algorithm: AlgorithmIdentifier, key: CryptoKey, data: inout Data) -> Any {
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

    /**
     deriveKey() returns a CryptoKey object rather than an ArrayBuffer. Essentially deriveKey() is composed of deriveBits() followed by importKey()
    */
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
