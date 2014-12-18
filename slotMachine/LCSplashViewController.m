//
//  LCSplashViewController.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCSplashViewController.h"
#import "LCCheckVersionTask.h"
#import "LCDownloadTask.h"

@interface LCSplashViewController ()

@end

@implementation LCSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LCCheckVersionTask *task = [[LCCheckVersionTask alloc] init];
//    [task requestWithBlockSucess:^(id sucess) {
//        
//    } andBlockFailure:^(id error) {
//        
//    }];

    LCDownloadTask *task = [[LCDownloadTask alloc] init];
    [task requestWithBlockSucess:^(id sucess) {
        NSURL *url = (NSURL *)sucess;
        NSDictionary *dir = [self readDict];
        
    } andBlockFailure:^(id error) {
        
    }];
    
}

- (NSDictionary *)readDict{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"/Default.plist"];
    
    NSDictionary *contentDict = [NSDictionary dictionaryWithContentsOfFile:filePath];    return contentDict;
}

- (void)presentMainViewController {
    [self performSegueWithIdentifier:@"PRESENT_MAIN" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
