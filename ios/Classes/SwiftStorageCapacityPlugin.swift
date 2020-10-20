import Flutter
import UIKit

public class SwiftStorageCapacityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "storage_capacity", binaryMessenger: registrar.messenger())
    let instance = SwiftStorageCapacityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

     if (call.method == "getPlatformVersion") {
               result("iOS " + UIDevice.current.systemVersion)
           }
            else if(call.method == "getFreeSpace"){
                if let freeSpaceInBytes = FileManagerUility.getFileSize(for: .systemFreeSize) {
                   result(freeSpaceInBytes)
                }
              }
              else if(call.method == "getOccupiedSpace"){
 if let totalSpaceInBytes = FileManagerUility.getFileSize(for: .systemSize) {
                 if let freeSpaceInBytes = FileManagerUility.getFileSize(for: .systemFreeSize) {
                                    let bytesOccupied = totalSpaceInBytes - freeSpaceInBytes
                                 }

                                }
                result(bytesOccupied)
              } else if(call.method == "getTotalSpace"){
                 if let totalSpaceInBytes = FileManagerUility.getFileSize(for: .systemSize) {
                                   result(totalSpaceInBytes)

                                }
              }
              else {
                result.notImplemented()
              }
  }
}
