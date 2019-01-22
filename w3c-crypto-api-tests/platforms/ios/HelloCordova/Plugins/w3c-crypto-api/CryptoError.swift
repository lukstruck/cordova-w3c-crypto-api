import Foundation

enum CryptoError: Error {
    case initFailed
    case invalidAccessError(field: String)
    case algorithmNotSupported(algorithm: String)
}
