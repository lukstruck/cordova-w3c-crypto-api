protocol PSubtleCrypto {
  func encrypt(algorithm: AlgorithmIdentifier,
               key: CryptoKey,
               data: [Int]) -> Any

  func decrypt(algorithm: AlgorithmIdentifier,
               key: CryptoKey,
               data: [Int]) -> Any

  func sign(algorithm: AlgorithmIdentifier,
            key: CryptoKey,
            data: [Int]) -> Any

  func verify(algorithm: AlgorithmIdentifier,
              key: CryptoKey,
              signature: [Int],
              data: [Int]) -> Any

  func digest(algorithm: AlgorithmIdentifier,
              data: [Int]) -> Any

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
                  length: Int) -> [Int]

  func importKey(format: KeyFormat,
                 keyData: [Int],
                 algorithm: AlgorithmIdentifier,
                 extractable: Bool,
                 keyUsages: [KeyUsage]) -> CryptoKey

  func exportKey(format: KeyFormat, key: CryptoKey) -> Any

  func wrapKey(format: KeyFormat,
               key: CryptoKey,
               wrappingKey: CryptoKey,
               wrapAlgorithm: AlgorithmIdentifier) -> Any

  func unwrapKey(format: KeyFormat,
                 wrappedKey: [Int],
                 unwrappingKey: CryptoKey,
                 unwrapAlgorithm: AlgorithmIdentifier,
                 unwrappedKeyAlgorithm: AlgorithmIdentifier,
                 extractable: Bool,
                 keyUsages: [KeyUsage]) -> CryptoKey
}
