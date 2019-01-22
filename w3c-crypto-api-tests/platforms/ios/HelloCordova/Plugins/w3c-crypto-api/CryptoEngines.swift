/**
 # CryptoEngies
 This file contains all the protocols needed for the Strategy Pattern in SubtleCrypto. The implementations are found in the respective `algorithmEngine.swift` file, where `algorithm` is the respective algorithm.
 */

// TODO create Factories for concrete classes
import Foundation

protocol EncryptDecryptEngine {
    func encrypt(_ algorithm: AlgorithmIdentifier, _ key: CryptoKey, _ data: inout Data) throws -> Any
    func decrypt(_ algorithm: AlgorithmIdentifier, _ key: CryptoKey, _ data: inout Data) throws -> Any
}
protocol SignVerifyEngine {}
protocol DigestEngine {}
protocol KeyEngine {}
