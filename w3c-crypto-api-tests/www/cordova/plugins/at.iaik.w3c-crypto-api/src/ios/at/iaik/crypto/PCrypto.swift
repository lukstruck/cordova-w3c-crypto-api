protocol PCrypto {
    func getRandomValues(length: Int)
    var subtle: PSubtleCrypto { get }
}