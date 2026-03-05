# Changelog

## [0.1.7] - 2026-03-05
- Optimized code and minor improvements across `LWDeviceInfo`, README, and added `validate_spm.sh`

## [0.1.6] - 2026-03-05
- Shared single `Reachability` instance across `networkState` and `networkType` to avoid redundant allocations
- `networkType` now returns granular values: `wifi`, `5g`, `4g`, `3g`, `2g`, `cellular`, `none`, `unknown` via `CTTelephonyNetworkInfo`
- Fixed `CTRadioAccessTechnologyNR/NRNSA` availability guard for iOS 14.1+
- `deviceModel` on simulator now reads `SIMULATOR_MODEL_IDENTIFIER` instead of returning `arm64`
- `batteryStatus` on simulator returns `"charging"` instead of `"unknown"`
- `deviceOrientation` falls back to `UIWindowScene.interfaceOrientation` when device orientation is unknown
- `beginGeneratingDeviceOrientationNotifications()` called in `init` for real-time orientation on real devices
- `isSimulator` changed from computed `var` to stored `let` (compile-time constant)
- `networkState` switch uses `default` instead of `case .none` to correctly handle nil reachability
- Updated README with full API table including all property descriptions and example values

## [0.1.5] - 2026-02-25
- Updated README with full API documentation

## [0.1.4] - 2026-02-24
- Added Objective-C support (`@objc`) across all public API

## [0.1.3] - 2026-02-12
- Integrated `Reachability.swift` for network state detection

## [0.1.2] - 2026-02-11
- Updated README and project metadata

## [0.1.1] - 2026-02-10
- Removed UIAlert showcase from README

## [0.1.0] - 2026-02-10
- Initial release with `getAllDeviceInfo()` covering battery, network, memory, storage, and device info
