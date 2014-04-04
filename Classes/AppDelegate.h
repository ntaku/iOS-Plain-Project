
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationCtrl;
@property (getter=isLandscape) BOOL landscape;

@end


@interface UINavigationController(Rotate)
@end


@implementation UINavigationController(Rotate)

- (NSUInteger)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}
@end
