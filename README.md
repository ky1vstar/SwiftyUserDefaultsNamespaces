# SwiftyUserDefaultsNamespaces

![Platforms](https://img.shields.io/badge/platforms-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-lightgrey.svg)
![CI](https://github.com/ky1vstar/SwiftyUserDefaultsNamespaces/workflows/CI/badge.svg)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](#cocoapods)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#swift-package-manager)

This is an extension for [SwiftyUserDefaults](https://github.com/sunshinejr/SwiftyUserDefaults) which provides support for namespaces (in fact nested `KeyStore`s). `SwiftyUserDefaultsNamespaces` is designed to separate preferences in parts which then can be supplied to according components in your project.

## Usage

Define your keys and namespaces!

```swift
extension DefaultsKeys {
    var launchCount: DefaultsKey<Int> {
        .init("launchCount", defaultValue: 0)
    }
    
    var player: DefaultsNamespace<PlayerKeyStore> {
        .init(namespaceKey: "player", keyStore: .init())
    }
}

struct PlayerKeyStore: DefaultsKeyStore {
    var volume: DefaultsKey<CGFloat?> {
        .init("volume")
    }
}
```

And just use it ;-)

```swift
Defaults[\.player][\.volume] = 1
Defaults.userSpecific(for: user)[\.name] = "David"
// or with dynamicMemberLookup
Defaults.player.volume = 1
```

## Installation

### CocoaPods

SwiftyUserDefaultsNamespaces is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'SwiftyUserDefaultsNamespaces'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate SwiftyUserDefaultsNamespaces into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ky1vstar/SwiftyUserDefaultsNamespaces"
```

Run `carthage update` to build the framework and drag the built `SwiftyUserDefaultsNamespaces.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ky1vstar/SwiftyUserDefaultsNamespaces.git", from: "1.0.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `SwiftyUserDefaultsNamespaces`.

## License

SwiftyUserDefaultsNamespaces is available under the MIT license. See the LICENSE file for more info.
