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

enum KeyFormat {
    case raw
    case pkcs8
    case spki
    case jwk
}

protocol CryptoKey {
  var type: KeyType { get }
  var extractable: Bool { get }
  var algorithm: AlgorithmIdentifier { get }
  var usages: [KeyUsage] { get }
};
