enum KeyType { 
  case publicKey
  case privateKey
  case secretKey
};

enum KeyUsage { 
  case encrypt
  case decrypt
  case sign
  case verify
  case deriveKey
  case deriveBits
  case wrapKey
  case unwrapKey 
};

protocol CryptoKey {
  var type: KeyType { get }
  var extractable: Bool { get }
  var algorithm: AlgorithmIdentifier { get }
  var usages: [KeyUsage] { get }
};