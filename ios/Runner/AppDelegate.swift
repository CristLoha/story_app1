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

    // Ambil API Key dari Config.plist
    if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
       let dict = NSDictionary(contentsOfFile: path),
       let apiKey = dict["GOOGLE_MAPS_API_KEY"] as? String {
        GMSServices.provideAPIKey(apiKey)
    } else {
        print("⚠️ GOOGLE_MAPS_API_KEY tidak ditemukan di Config.plist")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}