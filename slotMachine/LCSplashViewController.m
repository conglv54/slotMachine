//
//  LCSplashViewController.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCSplashViewController.h"

@interface LCSplashViewController ()

@end

@implementation LCSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *defaultValue = [self readDict];
    NSNumber *oldVersion = defaultValue[@"Version"];

    LCCheckVersionTask *checkVersionTask = [[LCCheckVersionTask alloc] init];
    [checkVersionTask requestWithBlockSucess:^(id sucess) {
        NSNumber *newVersion = sucess;
        if (oldVersion != newVersion) {
            [self downloadNewfileConfig];
        }
    } andBlockFailure:^(id error) {
        
    }];
}

- (void)downloadNewfileConfig {
    LCDownloadTask *task = [[LCDownloadTask alloc] init];
    [task requestWithBlockSucess:^(id sucess) {
        [self presentMainViewController];
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
