# LWFirstPod

[![Version](https://img.shields.io/cocoapods/v/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![License](https://img.shields.io/cocoapods/l/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![Platform](https://img.shields.io/cocoapods/p/LWFirstPod.svg?style=flat)](https://cocoapods.org/pods/LWFirstPod)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)

LWFirstPod is a comprehensive iOS device information retrieval library. It provides easy-to-use APIs to fetch device details like battery level, status, network connectivity, memory usage, storage, and more.

## Description

LWFirstPod is designed to bridge platform gaps by providing a unified API for accessing device information across different platforms. The library exposes individual properties as well as a comprehensive dictionary-based method for retrieving all device information at once.

## Features

- Battery level and status (real-time; returns `"charging"` on simulator)
- Network reachability and granular network type (Wi-Fi / 5G / 4G / 3G / 2G)
- App and device memory usage
- Total and used storage
- Device model identifier (returns simulated model on simulator)
- Device marketing name
- OS version, locale, timezone, screen size
- Device orientation with interface orientation fallback
- Simulator detection

## Requirements

- iOS 13.0+
- Swift 5.0+

## Methods

### `getAllDeviceInfo() -> [String: Any]`

Returns a dictionary containing all available device information.

**Returns:** A dictionary containing the following keys:

| Key | Description | Example |
|-----|-------------|---------|
| `releaseVersionNumber` | App release version | `"1.0.0"` |
| `buildVersionNumber` | App build number | `"42"` |
| `appName` | Application name | `"MyApp"` |
| `deviceModel` | Hardware model identifier | `"iPhone17,5"` |
| `deviceMarketingName` | Human-readable device name | `"iPhone 16e"` |
| `deviceOsVersion` | iOS version | `"18.3.1"` |
| `deviceBatteryLevel` | Battery percentage (0–100) | `87.0` |
| `batteryStatus` | Battery state | `"unplugged"` / `"charging"` / `"full"` / `"unknown"` / `"charging"` *(simulator)* |
| `deviceMemory` | Total physical memory | `"8 GB"` |
| `appMemoryUsage` | App's current memory usage | `"54 MB"` |
| `deviceRegionCode` | Locale region code | `"US"` |
| `deviceRegionName` | Locale region name | `"United States"` |
| `deviceTotalStorage` | Total storage capacity | `"256 GB"` |
| `deviceUsedStorage` | Used storage | `"128 GB"` |
| `deviceScreenSize` | Screen resolution in pixels | `"1179x2556"` |
| `deviceOrientation` | Current orientation (falls back to interface orientation) | `"portrait"` / `"landscapeLeft"` / etc. |
| `timezone` | Device timezone identifier | `"America/New_York"` |
| `networkState` | Connectivity state | `"connected"` / `"disconnected"` / `"unknown"` |
| `networkType` | Network type | `"wifi"` / `"5g"` / `"4g"` / `"3g"` / `"2g"` / `"cellular"` / `"none"` / `"unknown"` |
| `brand` | Device brand | `"Apple"` |
| `manufacturer` | Device manufacturer | `"Apple"` |
| `platform` | Platform | `"iOS"` |
| `firstInstallTime` | App first install timestamp (ISO 8601) | `"2024-01-15T10:30:00Z"` |
| `isSimulator` | Whether running on simulator | `true` / `false` |

### `showDeviceInfoAlert(from viewController: UIViewController? = nil)`

Displays an alert containing all device information. If no view controller is provided, automatically finds the topmost view controller.

**Parameters:**
- `viewController`: Optional `UIViewController` to present the alert from

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
    .package(url: "https://github.com/harshil-gandhi-us/LWFirstPod.git", .upToNextMajor(from: "0.1.7"))
]
```

Or add it directly in Xcode: `File > Add Packages...` and enter the repository URL.

## Author

harshil-gandhi-us, harshil.gandhi@logicwind.com

## License

LWFirstPod is available under the MIT license. See the LICENSE file for more info.
