protocol PCrypto {
    func getRandomValues(length: Int) -> Any
    var subtle: PSubtleCrypto { get }
}
