
#import "BaseController.h"

@interface BaseController ()

@end


@implementation BaseController

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Initialize
///////////////////////////////////////////////////////////////////////////////////////////////////


- (id)init{
    if(self = [super init]){

    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark View lifecycle
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)viewDidLoad{
    [super viewDidLoad];

    // view configuration
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

    // toolbar configuration
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.toolbar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
    [self adjustViewFrame];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark View Rotation
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)adjustViewFrame{
    // for toolbar
    if(!self.toolbar.isHidden){
        CGRect naviRect = self.navigationController.navigationBar.frame;
        CGRect viewRect = self.view.bounds;
        CGRect rect = CGRectMake(0, viewRect.size.height-naviRect.size.height, viewRect.size.width, naviRect.size.height);
        self.toolbar.frame = rect;
        [self.view bringSubviewToFront:self.toolbar];
    }
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
//    if(IPAD){
        return UIInterfaceOrientationMaskAll;
//    }
//    return UIInterfaceOrientationMaskPortrait;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
    [super willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
    [self adjustViewFrame];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark IPad PopOver
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)popOver:(id)sender withInner:(UIViewController *)ctrl{
    if(self.popOverCtrl){
        if(self.popOverCtrl.popoverVisible){
            [self.popOverCtrl dismissPopoverAnimated:NO];
        }
        self.popOverCtrl = nil;
    }
    
    self.popOverCtrl = [[UIPopoverController alloc] initWithContentViewController:ctrl];
    self.popOverCtrl.delegate = self;
    self.popOverCtrl.backgroundColor = [UIColor whiteColor];
    [self.popOverCtrl presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)activityViewPopOver:(id)sender withInner:(UIViewController *)ctrl{
    if(self.popOverCtrl){
        if(self.popOverCtrl.popoverVisible){
            [self.popOverCtrl dismissPopoverAnimated:NO];
        }
        self.popOverCtrl = nil;
    }
    
    self.popOverCtrl = [[UIPopoverController alloc] initWithContentViewController:ctrl];
    self.popOverCtrl.delegate = self;
    self.popOverCtrl.backgroundColor = [UIColor whiteColor];
    [self.popOverCtrl presentPopoverFromRect:((UIView *)sender).bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Toolbar
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)showToolbar:(NSArray *)items{
    [self.view addSubview:self.toolbar];
    [self.toolbar setItems:items];
}

@end
