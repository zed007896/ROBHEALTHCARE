
ad your GoogleSigninViewController.
import UIKit

    @main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setUpRoot()
        return true
    }
    
    func setUpRoot() {
        let startUpPageVC = ()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: startUpPageVC)
        window?.makeKeyAndVisible()
    }
}
