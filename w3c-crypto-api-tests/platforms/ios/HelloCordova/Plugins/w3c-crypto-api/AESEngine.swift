import Foundation

class AESEngine: EncryptDecryptEngine, KeyEngine {
    
    func encrypt(_ algorithm: AlgorithmIdentifier, _ key: CryptoKey, _ data: inout Data) throws -> Any {
        return try AESEngine.encrypt(algorithm: algorithm.algorithm, digest: data, iv: algorithm.iv!, key: key.key)
    }
    
    func decrypt(_ algorithm: AlgorithmIdentifier, _ key: CryptoKey, _ data: inout Data) throws -> Any {
        return try AESEngine.decrypt(algorithm: algorithm.algorithm, encrypted: data, iv: algorithm.iv!, key: key.key)
    }
    

    // TODO move this to CryptoError.swift
    enum Error: Swift.Error {
        case keyGeneration(status: Int)
        case cryptoFailed(status: CCCryptorStatus)
    }

    // TODO remove this wrap
    static func encrypt(algorithm: Algorithm, digest: Data, iv: Data, key: Data) throws -> Data {
        return try crypt(algorithm: algorithm, input: digest, operation: CCOperation(kCCEncrypt), iv: iv, key: key)
    }

    static func decrypt(algorithm: Algorithm, encrypted: Data, iv: Data, key: Data) throws -> Data {
        return try crypt(algorithm: algorithm, input: encrypted, operation: CCOperation(kCCDecrypt), iv: iv, key: key)
    }

    private static func crypt(algorithm: Algorithm, input: Data, operation: CCOperation, iv: Data, key: Data) throws -> Data {
        var outLength = Int(0)
        var outBytes = [UInt8](repeating: 0, count: input.count + kCCBlockSizeAES128)
        var status: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
        input.withUnsafeBytes { (encryptedBytes: UnsafePointer<UInt8>!) -> Void in
            iv.withUnsafeBytes { (ivBytes: UnsafePointer<UInt8>!) in
                key.withUnsafeBytes { (keyBytes: UnsafePointer<UInt8>!) -> Void in
                    status = CCCrypt(operation,
                                    CCAlgorithm(kCCAlgorithmAES128),            // algorithm
                                    CCOptions(kCCOptionPKCS7Padding),           // options
                                    keyBytes,                                   // key
                                    key.count,                                  // keylength
                                    ivBytes,                                    // iv
                                    encryptedBytes,                             // dataIn
                                    input.count,                                // dataInLength
                                    &outBytes,                                  // dataOut
                                    outBytes.count,                             // dataOutAvailable
                                    &outLength)                                 // dataOutMoved
                }
            }
        }
        guard status == kCCSuccess else {
            throw Error.cryptoFailed(status: status)
        }
        return Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength)
    }

    // TODO implement KeyEngine
    static func generateKey(length: Int, extractable: Bool, keyUsages: [KeyUsage]) throws -> Any {

        var status = Int32(0)
        var derivedBytes = [UInt8](repeating: 0, count: length)
        var password: Data = "TheInternetToldMeThisIsFineAsLongAsTheSaltIsDifferentEveryTime".data(using: .utf8)!
        var salt = self.random(length: 8)

        password.withUnsafeBytes { (passwordBytes: UnsafePointer<Int8>!) in
            salt.withUnsafeBytes { (saltBytes: UnsafePointer<UInt8>!) in
                status = CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2),                  // algorithm
                    passwordBytes,                                // password
                    password.count,                               // passwordLen
                    saltBytes,                                    // salt
                    salt.count,                                   // saltLen
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1),   // prf
                    10000,                                        // rounds
                    &derivedBytes,                                // derivedKey
                    length)                                       // derivedKeyLen
            }
        }
        guard status == 0 else {
            throw Error.keyGeneration(status: Int(status))
        }
        return Data(bytes: UnsafePointer<UInt8>(derivedBytes), count: length)

    }

    // TODO replace this with call to Crypto.swift
    static func random(length: Int) -> Data {
        var data = Data(count: length)
        let status = data.withUnsafeMutableBytes { mutableBytes in
            SecRandomCopyBytes(kSecRandomDefault, length, mutableBytes)
        }
        assert(status == Int32(0))
        return data
    }
}
