import Foundation

enum CryptoError: Error {
    case initFailed
    case invalidAccessError(field: String)
    case algorithmNotSupported(algorithm: String)
    case keyGeneration(status: Int)
    case cryptoFailed(status: CCCryptorStatus)
}
