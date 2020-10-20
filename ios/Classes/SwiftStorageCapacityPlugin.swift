import Flutter
import UIKit
import Foundation

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
do
        {
            let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())

            return result(attributes[FileAttributeKey.systemFreeSize] as! Int64)
        }
        catch
        {
            return result("")
        }
              }
                          else if(call.method == "getOccupiedSpace"){
                            do{
            let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            let totalSpace = attributes[FileAttributeKey.systemSize] as! Int64
            let attributesFree = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            let freeSpace = attributesFree[FileAttributeKey.systemFreeSize] as! Int64
            return result(totalSpace-freeSpace)
                            }catch {
            return result("")
        }
              }
                                        else if(call.method == "getTotalSpace"){
do {
            let attributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            return result(attributes[FileAttributeKey.systemSize] as! Int64)
        } catch {
            return result("")
        }
              }
  }
}
