# LWFirstPod

[![Version](https://img.shields.io/cocoapods/v/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![License](https://img.shields.io/cocoapods/l/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![Platform](https://img.shields.io/cocoapods/p/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)

LWFirstPod is a comprehensive iOS device information retrieval library. It provides easy-to-use APIs to fetch device details like battery level, status, network connectivity, memory usage, storage, and more.

## Features

- Battery level and status
- Network reachability and type
- Memory usage
- Storage details
- Device model, OS version, and locale information

## Requirements

- iOS 13.0+
- Swift 5.0+

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
import LWFirstPod

// Show device info alert
LWDeviceInfo.shared.showDeviceInfoAlert(from: self)

// Get all info as dictionary
let info = LWDeviceInfo.shared.getAllDeviceInfo()
```

## Installation

### CocoaPods

LWFirstPod is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'LWFirstPod'
```

### Swift Package Manager

To integrate LWFirstPod into your Xcode project using SPM, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/harshil-gandhi-us/LWFirstPod.git", .upToNextMajor(from: "0.1.1"))
]
```

Or add it directly in Xcode: `File > Add Packages...` and enter the repository URL.

## Author

harshil-gandhi-us, harshil.gandhi@logicwind.com

## License

LWFirstPod is available under the MIT license. See the LICENSE file for more info.
