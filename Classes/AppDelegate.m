
#import "AppDelegate.h"
#import "MainController.h"

@interface AppDelegate()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [self setOrientationEvent];

    MainController *mc = MainController.new;
    [self.navigationCtrl pushViewController:mc animated:NO];
    
    [self.window setRootViewController:self.navigationCtrl];
    [self.window makeKeyAndVisible];

    [self setAppearance];
    return YES;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Application Lifecycle
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)applicationWillResignActive:(UIApplication *)application{
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
}

- (void)applicationWillTerminate:(UIApplication *)application{
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Device Orientation Events
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)setOrientationEvent{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification{
    UIDeviceOrientation o = [[UIDevice currentDevice] orientation];
	if(o == UIDeviceOrientationLandscapeLeft || o == UIDeviceOrientationLandscapeRight){
        self.landscape = YES;
        
	}else if(o == UIDeviceOrientationPortrait || o == UIDeviceOrientationPortraitUpsideDown){
        self.landscape = NO;
        
	}else{
        CGRect r = self.navigationCtrl.view.bounds;
        if(r.size.width > r.size.height){
            self.landscape = YES;
        }
    }
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskAll;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Appearance
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)setAppearance{
    NSDictionary *large = @{
                             NSFontAttributeName : [UIFont systemFontOfSize:18],
                             NSForegroundColorAttributeName : [UIColor blackColor]
                             };
    NSDictionary *small = @{
                             NSFontAttributeName : [UIFont boldSystemFontOfSize:15],
                             NSForegroundColorAttributeName : [UIColor blackColor]
                             };

    [[UINavigationBar appearance] setTitleTextAttributes:large];
    [[UIBarButtonItem appearance] setTitleTextAttributes:small forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:small forState:UIControlStateHighlighted];
}

@end
