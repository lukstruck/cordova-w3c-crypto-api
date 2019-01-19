
// Demo1
window.crypto.getRandomValues(new Int8Array(5));





// Demo2
let safeKey = {};
window.crypto.subtle.generateKey(
    {
        name: "AES-CBC",
        length: 256, //can be  128, 192, or 256
    },
    false, //whether the key is extractable (i.e. can be used in exportKey)
    ["encrypt", "decrypt"] //can be "encrypt", "decrypt", "wrapKey", or "unwrapKey"
)
.then(function(key){
    //returns a key object
    safeKey = key;
    console.log(key);
})
.catch(function(err){
    console.error(err);
});





// Demo3
let data = Int8Array.from('1337');
let secretData = {};
let iv = window.crypto.getRandomValues(new Uint8Array(16));
window.crypto.subtle.encrypt(
    {
        name: "AES-CBC",
        //Don't re-use initialization vectors!
        //Always generate a new iv every time your encrypt!
        iv: iv,
    },
    safeKey, //from generateKey or importKey above
    data //ArrayBuffer of data you want to encrypt
)
.then(function(encrypted){
    //returns an ArrayBuffer containing the encrypted data
    console.log(new Uint8Array(encrypted));
    secretData = new Uint8Array(encrypted);
})
.catch(function(err){
    console.error(err);
});






// Demo4
window.crypto.subtle.decrypt(
    {
        name: "AES-CBC",
        iv: iv, //The initialization vector you used to encrypt
    },
    safeKey, //from generateKey or importKey above
    secretData //ArrayBuffer of the data
)
.then(function(decrypted){
    //returns an ArrayBuffer containing the decrypted data
    console.log(new Uint8Array(decrypted));
})
.catch(function(err){
    console.error(err);
});
