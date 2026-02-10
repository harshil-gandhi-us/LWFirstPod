#if canImport(UIKit)
import UIKit
import Foundation
import Network
import SystemConfiguration

public class LWDeviceInfo {
    
    public static let shared = LWDeviceInfo()
    
    private init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
    
    public func getAllDeviceInfo() -> [String: Any] {
        return [
            "releaseVersionNumber": releaseVersionNumber,
            "buildVersionNumber": buildVersionNumber,
            "appName": appName,
            "deviceModel": deviceModel,
            "deviceOsVersion": deviceOsVersion,
            "deviceBatteryLevel": deviceBatteryLevel,
            "batteryStatus": batteryStatus,
            "deviceMemory": deviceMemory,
            "appMemoryUsage": appMemoryUsage,
            "deviceRegionCode": deviceRegionCode,
            "deviceRegionName": deviceRegionName,
            "deviceTotalStorage": deviceTotalStorage,
            "deviceUsedStorage": deviceUsedStorage,
            "deviceScreenSize": deviceScreenSize,
            "deviceOrientation": deviceOrientation,
            "timezone": timezone,
            "networkState": networkState,
            "brand": brand,
            "manufacturer": manufacturer,
            "platform": platform,
            "firstInstallTime": firstInstallTime,
            "isSimulator": isSimulator,
            "networkType": networkType
        ]
    }
    
    public func showDeviceInfoAlert(from viewController: UIViewController? = nil) {
        let info = getAllDeviceInfo()
        let sortedKeys = info.keys.sorted()
        
        var message = ""
        for key in sortedKeys {
            let value = info[key] ?? "N/A"
            message += "• \(key): \(value)\n"
        }
        
        let alert = UIAlertController(title: "Device Details", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        // Find the view controller to present from
        let presenter = viewController ?? findTopViewController()
        presenter?.present(alert, animated: true, completion: nil)
    }
    
    private func findTopViewController() -> UIViewController? {
        var topController: UIViewController?
        
        if #available(iOS 13.0, *) {
            topController = UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .filter { $0.isKeyWindow }
                .first?.rootViewController
        } else {
            topController = UIApplication.shared.keyWindow?.rootViewController
        }
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    public var releaseVersionNumber: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    public var buildVersionNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    public var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    public var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    public var deviceOsVersion: String {
        return UIDevice.current.systemVersion
    }
    
    public var deviceBatteryLevel: Float {
        let level = UIDevice.current.batteryLevel
        return level < 0 ? 0 : level * 100
    }
    
    public var batteryStatus: String {
        switch UIDevice.current.batteryState {
        case .unplugged: return "unplugged"
        case .charging: return "charging"
        case .full: return "full"
        case .unknown: return "unknown"
        @unknown default: return "unknown"
        }
    }
    
    public var deviceMemory: String {
        let memory = ProcessInfo.processInfo.physicalMemory
        return ByteCountFormatter.string(fromByteCount: Int64(memory), countStyle: .memory)
    }
    
    public var appMemoryUsage: String {
        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }
        if kerr == KERN_SUCCESS {
            return ByteCountFormatter.string(fromByteCount: Int64(taskInfo.resident_size), countStyle: .memory)
        } else {
            return "0"
        }
    }
    
    public var deviceRegionCode: String {
        return Locale.current.regionCode ?? ""
    }
    
    public var deviceRegionName: String {
        if let regionCode = Locale.current.regionCode {
            return Locale.current.localizedString(forRegionCode: regionCode) ?? ""
        }
        return ""
    }
    
    public var deviceTotalStorage: String {
        if let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
           let totalSize = attributes[.systemSize] as? Int64 {
            return ByteCountFormatter.string(fromByteCount: totalSize, countStyle: .file)
        }
        return "0"
    }
    
    public var deviceUsedStorage: String {
        if let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
           let totalSize = attributes[.systemSize] as? Int64,
           let freeSize = attributes[.systemFreeSize] as? Int64 {
            return ByteCountFormatter.string(fromByteCount: totalSize - freeSize, countStyle: .file)
        }
        return "0"
    }
    
    public var deviceScreenSize: String {
        let bounds = UIScreen.main.bounds
        let scale = UIScreen.main.scale
        return "\(Int(bounds.width * scale))x\(Int(bounds.height * scale))"
    }
    
    public var deviceOrientation: String {
        switch UIDevice.current.orientation {
        case .portrait: return "portrait"
        case .portraitUpsideDown: return "portraitUpsideDown"
        case .landscapeLeft: return "landscapeLeft"
        case .landscapeRight: return "landscapeRight"
        case .faceUp: return "faceUp"
        case .faceDown: return "faceDown"
        case .unknown: return "unknown"
        @unknown default: return "unknown"
        }
    }
    
    public var timezone: String {
        return TimeZone.current.identifier
    }
    
    public var networkState: String {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return "unknown"
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return "unknown"
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection) ? "connected" : "disconnected"
    }
    
    public var brand: String {
        return "Apple"
    }
    
    public var manufacturer: String {
        return "Apple"
    }
    
    public var platform: String {
        return "iOS"
    }
    
    public var firstInstallTime: String {
        if let urlToDocumentsFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last,
           let attributes = try? FileManager.default.attributesOfItem(atPath: urlToDocumentsFolder.path),
           let installDate = attributes[.creationDate] as? Date {
            let formatter = ISO8601DateFormatter()
            return formatter.string(from: installDate)
        }
        return ""
    }
    
    public var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    public var networkType: String {
        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        var flags: SCNetworkReachabilityFlags = []
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !flags.contains(.reachable) {
            return "none"
        }
        
        if flags.contains(.isWWAN) {
            return "cellular"
        }
        
        return "wifi"
    }
}
#endif
