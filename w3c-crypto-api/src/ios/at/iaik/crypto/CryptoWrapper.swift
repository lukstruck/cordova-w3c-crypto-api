
import Foundation

class CryptoWrapper: CDVPlugin {
    func encrypt(command: CDVInvokedUrlCommand){
        var data = Data()
        // TODO cast properly
        let funcResult = SubtleCrypto().encrypt(algorithm: command.arguments?[0] as! AlgorithmIdentifier, key: command.arguments?[1] as! CryptoKey, data: &data)
        // TODO return correct status
        let result: CDVPluginResult = CDVPluginResult(status: funcResult as! CDVCommandStatus, messageAs: data.arrayOfBytes())
        self.commandDelegate.send(result, callbackId: command.callbackId)
    }
}
