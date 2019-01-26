# Cordova W3C Web Crypto API

This is a Cordova plugin for ios that implements some of the W3C Web Crypto API functionality. It is still under development and not finished.

## Getting Started

The repo contains two sub folders, 

```bash
w3c-crypto-api/
w3c-crypto-api-tests/
```

with the former being a complete Cordova project to test the plugin. All development of the plugin should be done in the project as well, as I didn't find any convenient way to open the plugin files in XCode otherwise.

To install the plugin, clone the repo and open a terminal in your Cordova project. Then `cordova plugin add "/path/to/this/repo/w3c-crypto-api"`.

### Prerequisites

You will need a Cordova project with an iOS platform. If you want to test this plugin, open the existing Cordova Test Project: `w3c-crypto-api-tests`.

## Running the tests

To run the tests, simply type `npm run all-tests` in the main folder.

### SwiftLint

Linting exists, run it by typing 

```bash
npm run lint
```

You can manually run the different linters by typing

```bash
npm run swiftlint
npm run jslint
```

SwiftLint also supports autocorrect:

```bash
swiftlint autocorrect
```

### Unit Tests

There exist Swift Unit Tests in the w3c-crypto-api-tests project, you can access them with XCode. There exist no JS Unit tests. These have to be done in the Manual tests.

### Manual Tests

You can manually test the plugin by running the test application. If it does not crash, all tests run successfully (Only method yet).
Run the test application with:

```bash
cd w3c-crypto-api-tests
npm run emu-test
```

## Project architecture

### w3c-crypto-api

As it is common for a cordova plugin, the plugin contains two sub folders:

```bash
src/
www/
```

where `www/` contains the JavaScript files that are accessible to the outside and `src/ios/` contains the Swift files that run natively. 

All calls over the cordova interface `cordova.exec()` call the `CryptoWrapper.swift`, which then wraps around `Crypto.swift` and `SubtleCrypto.swift`. The calls to `Crypto.swift` only contains the `getRandomValues()` method.

`SubtleCrypto` has to be built in a factory first (TODO implement Factory) as it is part of a Strategy Pattern to easily add new functionality. The calls are as described as in the [W3C Crypto API Reference](https://www.w3.org/TR/WebCryptoAPI/). The strategies will take care of error handling, the wrapper function is only to construct a normalized algorithm. (TODO add normalized algorithm)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
