//
//  LCSplashViewController.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCSplashViewController.h"
#import "LCFileManager.h"
#import "LCCheckVersion.h"
#import "LCGetUserInfo.h"

@interface LCSplashViewController ()

@end

@implementation LCSplashViewController {
    LCFileManager *fileManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    fileManager = [LCFileManager shareInstance];

    __block BOOL isFirstLaunch = [fileManager isFirstLaunch];
    if (isFirstLaunch) {
        
        LCRegisterTask *registerTask = [[LCRegisterTask alloc] initWithDeviceID:[Utils getUniqueDeviceIdentifierAsString]];
        [registerTask requestWithBlockSucess:^(id sucess) {
            isFirstLaunch = false;
            [fileManager setIsFirstLaunch:isFirstLaunch];
            [fileManager saveSessionID:sucess];
            [self checkVersion];
        } andBlockFailure:^(id error) {
            
        }];
        
    } else {
        [self checkVersion];
    }
}

- (void)getUserInfo {
    LCGetUserInfo *getUserInfo = [[LCGetUserInfo alloc] init];
    [getUserInfo requestWithBlockSucess:^(id sucess) {
        
    } andBlockFailure:^(id error) {
        
    }];
}

- (void)checkVersion {
    NSString *currentVersion = [fileManager getVersion];
    LCCheckVersionTask *checkVersionTask = [[LCCheckVersionTask alloc] initWithVersion:currentVersion];
    
    [checkVersionTask requestWithBlockSucess:^(id sucess) {
        
        LCCheckVersion *checkVersion = sucess;
        BOOL isUpdate = checkVersion.isUpdate;
        
        if (isUpdate) {
            [fileManager setSettingDefault:checkVersion.setting];
        }
        
        [self presentMainViewController];
        
    } andBlockFailure:^(id error) {
        
    }];    
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
