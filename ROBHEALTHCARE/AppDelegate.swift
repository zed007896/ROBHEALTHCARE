import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Create HomeViewController from xib
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        // Set it as the root view controller
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        return true
    }

    // ... other AppDelegate methods if needed ...
}
