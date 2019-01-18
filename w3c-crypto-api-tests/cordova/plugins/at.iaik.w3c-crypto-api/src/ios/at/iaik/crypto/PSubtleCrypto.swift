protocol PSubtleCrypto {
  func encrypt(algorithm: AlgorithmIdentifier,
               key: CryptoKey,
               data: BufferSource) -> Any

  func decrypt(algorithm: AlgorithmIdentifier,
               key: CryptoKey,
               data: BufferSource) -> Any

  func sign(algorithm: AlgorithmIdentifier,
            key: CryptoKey,
            data: BufferSource) -> Any

  func verify(algorithm: AlgorithmIdentifier,
              key: CryptoKey,
              signature: BufferSource,
              data: BufferSource) -> Any

  func digest(algorithm: AlgorithmIdentifier,
              data: BufferSource) -> Any

  func generateKey(algorithm: AlgorithmIdentifier,
                   extractable: Bool,
                   keyUsages: [KeyUsage]) -> Any

  func deriveKey(algorithm: AlgorithmIdentifier,
                 baseKey: CryptoKey,
                 derivedKeyType: AlgorithmIdentifier,
                 extractable: Bool,
                 keyUsages: [KeyUsage]) -> Any

  func deriveBits(algorithm: AlgorithmIdentifier,
                  baseKey: CryptoKey,
                  length: long) -> ArrayBuffer

  func importKey(format: KeyFormat,
                 (BufferSource JsonWebKey: or) keyData,
                 algorithm: AlgorithmIdentifier,
                 extractable: boolean,
                 keyUsages: [KeyUsage]) -> CryptoKey

  func exportKey(format: KeyFormat, key: CryptoKey) -> Any

  func wrapKey(format: KeyFormat,
               key: CryptoKey,
               wrappingKey: CryptoKey,
               wrapAlgorithm: AlgorithmIdentifier) -> Any
               
  func unwrapKey(format: KeyFormat,
                 wrappedKey: BufferSource,
                 unwrappingKey: CryptoKey,
                 unwrapAlgorithm: AlgorithmIdentifier,
                 unwrappedKeyAlgorithm: AlgorithmIdentifier,
                 extractable: boolean,
                 keyUsages: [KeyUsage]) -> CryptoKey
}
