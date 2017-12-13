//
//  ViewController.m
//  LBImagePreviewBrowser
//
//  Created by 李冰 on 2017/12/13.
//  Copyright © 2017年 李冰. All rights reserved.
//

#import "ViewController.h"
#import "LBImagePreviewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 60, 30)];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(presentAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)presentAction:(UIButton *)sender {
    
    NSMutableArray *images = [NSMutableArray new];
    
    for (int i = 1; i < 11; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"timg-%d.jpeg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    LBImagePreviewController *vc = [[LBImagePreviewController alloc] initWithAssetArray:images.copy];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
