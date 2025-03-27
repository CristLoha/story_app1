import Flutter
import UIKit
import GoogleMaps  

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAlso8drO2PjU2r4RPJ-GvIT-CKhcjtAxc")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}