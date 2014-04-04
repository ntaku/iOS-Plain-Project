
#import "MainController.h"

@interface MainController ()

@end


@implementation MainController


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Initialize
///////////////////////////////////////////////////////////////////////////////////////////////////


- (id)init{
    if(self = [super init]){
        self.title = @"Main";
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark View lifecycle
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupSample];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Sample code
///////////////////////////////////////////////////////////////////////////////////////////////////


- (void)setupSample{
    
    // localization
    LOG(@"%@", LS(@"Lang"));

    // popover
    UIBarButtonItem *right = [[UIBarButtonItem alloc]
                              initWithTitle:@"popup"
                              style:UIBarButtonItemStylePlain
                              target:self action:@selector(actionPopup:)];
    self.navigationItem.rightBarButtonItem = right;

    // toolbar
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *a = [[UIBarButtonItem alloc] initWithTitle:@"btnA" style:UIBarButtonItemStylePlain target:self action:@selector(actionA)];
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"btnB" style:UIBarButtonItemStylePlain target:self action:@selector(actionB)];
    UIBarButtonItem *c = [[UIBarButtonItem alloc] initWithTitle:@"btnC" style:UIBarButtonItemStylePlain target:self action:@selector(actionC)];
    
    NSArray *items = @[space, a, space, b, space, c, space];
    [self showToolbar:items];
}

- (void)actionPopup:(id)sender{
    LOG_METHOD;
    UIViewController *c = UIViewController.new;
    c.view.backgroundColor = [UIColor blueColor];
    
    if(IPAD){
        UINavigationController *n = [[UINavigationController alloc] initWithRootViewController:c];
        [self popOver:sender withInner:n];
    }else{
        [self.navigationController pushViewController:c animated:YES];
    }
}

- (void)actionA{
    LOG_METHOD;
}

- (void)actionB{
    LOG_METHOD;
}

- (void)actionC{
    LOG_METHOD;
}

@end
