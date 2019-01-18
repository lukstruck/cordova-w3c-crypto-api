class Crypto: PCrypto {

    var subtle: PSubtleCrypto

    init() {
        self.subtle = SubtleCrypto()
    }

    func getRandomValues(length: Int) -> Any {
        abort()
    }

}
