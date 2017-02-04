class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    Fabric.with([Crashlytics])

    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'fabric'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    # NSLog "Crashlytics.sharedInstance.crash"
    # Crashlytics.sharedInstance.crash

    true
  end
end
