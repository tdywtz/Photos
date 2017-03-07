//
//  LHPhotosController.m
//  photos
//
//  Created by bangong on 16/1/18.
//  Copyright © 2016年 auto. All rights reserved.
//

#import "LHPhotosNavigationController.h"
#import "LHPhotosGroupsViewController.h"
#import "CTAssetsViewControllerTransition.h"

@interface LHPhotosNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LHPhotosNavigationController

- (instancetype)init
{
    
    LHPhotosGroupsViewController *photosView = [[LHPhotosGroupsViewController alloc] init];
    self = [super  initWithRootViewController:photosView];
  
    _maxNumber = 6;
    self.delegate = self;
    return self;
}

-(void)resultPhotos:(void (^)(NSArray<__kindof PHAsset *> *))block{
    self.photos = block;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{

    if (![fromVC isKindOfClass:NSClassFromString(@"LHPhotosPageViewController")] && ![toVC isKindOfClass:NSClassFromString(@"LHPhotosPageViewController")]) {
        return nil;
    }
    CTAssetsViewControllerTransition *transition = [[CTAssetsViewControllerTransition alloc] init];
    transition.operation = operation;

    return transition;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
