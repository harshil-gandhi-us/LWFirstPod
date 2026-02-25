# LWFirstPod

[![Version](https://img.shields.io/cocoapods/v/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![License](https://img.shields.io/cocoapods/l/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![Platform](https://img.shields.io/cocoapods/p/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)

LWFirstPod is a comprehensive iOS device information retrieval library. It provides easy-to-use APIs to fetch device details like battery level, status, network connectivity, memory usage, storage, and more.

## Description

LWFirstPod is designed to bridge platform gaps by providing a unified API for accessing device information across different platforms. The library exposes individual properties as well as a comprehensive dictionary-based method for retrieving all device information at once.

## Features

- Battery level and status
- Network reachability and type
- Memory usage
- Storage details
- Device model, OS version, and locale information

## Requirements

- iOS 13.0+
- Swift 5.0+

## Methods

### `getAllDeviceInfo() -> [String: Any]`

Returns a dictionary containing all available device information. This method provides a unified interface for retrieving comprehensive device details, mapped from corresponding implementations on other platforms for consistent API design.

**Returns:** A dictionary containing the following keys:
- `releaseVersionNumber`: App release version
- `buildVersionNumber`: App build version
- `appName`: Application name
- `deviceModel`: Device model identifier
- `deviceOsVersion`: iOS version
- `deviceBatteryLevel`: Battery level (0-100)
- `batteryStatus`: Current battery state
- `deviceMemory`: Total device memory
- `appMemoryUsage`: Memory used by the app
- `deviceRegionCode`: Region code
- `deviceRegionName`: Region name
- `deviceTotalStorage`: Total storage capacity
- `deviceUsedStorage`: Used storage capacity
- `deviceScreenSize`: Screen resolution
- `deviceOrientation`: Current device orientation
- `timezone`: Device timezone
- `networkState`: Network connectivity state
- `brand`: Device brand (Apple)
- `manufacturer`: Device manufacturer (Apple)
- `platform`: Platform (iOS)
- `firstInstallTime`: App first installation timestamp
- `isSimulator`: Whether running on simulator
- `networkType`: Type of network connection

### `showDeviceInfoAlert(from viewController: UIViewController? = nil)`

Displays an alert containing all device information. If no view controller is provided, the method finds the topmost view controller in the window hierarchy.

**Parameters:**
- `viewController`: Optional UIViewController to present the alert from

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
import LWFirstPod

// Show device info alert
LWDeviceInfo.shared.showDeviceInfoAlert(from: self)

// Get all info as dictionary
let info = LWDeviceInfo.shared.getAllDeviceInfo()
```

**Objective-C:**

```objc
@import LWFirstPod;

// Show device info alert
[[LWDeviceInfo shared] showDeviceInfoAlertFrom:self];

// Get all device info as NSDictionary
NSDictionary *info = [[LWDeviceInfo shared] getAllDeviceInfo];
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
    .package(url: "https://github.com/harshil-gandhi-us/LWFirstPod.git", .upToNextMajor(from: "0.1.4"))
]
```

Or add it directly in Xcode: `File > Add Packages...` and enter the repository URL.

## Author

harshil-gandhi-us, harshil.gandhi@logicwind.com

## License

LWFirstPod is available under the MIT license. See the LICENSE file for more info.
