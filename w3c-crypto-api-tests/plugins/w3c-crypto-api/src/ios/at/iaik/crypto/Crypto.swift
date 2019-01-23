class Crypto: PCrypto {
    var subtle: PSubtleCrypto

    init() {
        self.subtle = SubtleCrypto()
    }

    // TODO maybe use CCRandomGenerateBytes? since it's CommonCrypto -> consistency
    func getRandomValues( bytes: inout [Int]) -> Any {
        return SecRandomCopyBytes(kSecRandomDefault, bytes.capacity, &bytes)
    }

}
