protocol PCrypto {
    func getRandomValues(bytes: inout [Int]) -> Any
    var subtle: PSubtleCrypto { get }
}
