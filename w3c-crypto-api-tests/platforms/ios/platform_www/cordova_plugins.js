cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "w3c-crypto-api.crypto",
    "file": "plugins/w3c-crypto-api/www/js/Crypto.js",
    "pluginId": "w3c-crypto-api",
    "clobbers": [
      "crypto"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-whitelist": "1.3.3",
  "w3c-crypto-api": "0.0.1"
};
// BOTTOM OF METADATA
});