class Crypto: PCrypto {
    var subtle: PSubtleCrypto

    init() {
        self.subtle = SubtleCrypto()
    }

    func getRandomValues( bytes: inout [Int]) -> Any {
        return SecRandomCopyBytes(kSecRandomDefault, bytes.capacity, &bytes)
    }

}
