enum Algorithm: String {
    case HMAC = "HMAC"
    case RSASSA_PKCS1_v1_5 = "RSASSA-PKCS1-v1_5"
    case RSA_PSS = "RSA-PSS"
    case MGF1 = "MGF1"
    case RSA_OAEP = "RSA-OAEP"
    case ECDSA = "ECDSA"
    case P_256 = "P-256"
    case AES_CBC = "AES-CBC"
}

protocol AlgorithmIdentifier {
    var algorithm: Algorithm { get }
    var iv: Data? { get }
}
