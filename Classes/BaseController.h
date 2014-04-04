
#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <UIPopoverControllerDelegate>

@property (nonatomic, strong) UIPopoverController *popOverCtrl; // for iPad
@property (nonatomic, strong) UIToolbar *toolbar;

// for view layout adjustment
- (void)adjustViewFrame;

// for iPad
- (void)popOver:(id)sender withInner:(UIViewController *)ctrl;
- (void)activityViewPopOver:(id)sender withInner:(UIViewController *)ctrl;

- (void)showToolbar:(NSArray *)items;

@end
