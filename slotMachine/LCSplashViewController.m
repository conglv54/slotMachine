//
//  LCSplashViewController.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCSplashViewController.h"
#import "LCViewController.h"
#import "LCFileManager.h"
#import "LCCheckVersion.h"
#import "LCGetUserInfo.h"
#import "HARegister.h"
#import "LCRegister.h"
#import "LCItem.h"
#import <SSZipArchive.h>

@interface LCSplashViewController () <UIAlertViewDelegate>

@end

@implementation LCSplashViewController {
    LCFileManager *fileManager;
    
    __weak IBOutlet UIActivityIndicatorView *indicatorLoading;
    
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
            [fileManager saveSessionID:sucess[@"session_id"]];
            
            int totalCoin = [sucess[@"major_coins_total"] intValue] + [sucess[@"free_coins_total"] intValue];
            
            [fileManager setUserWithFreeCoin:[sucess[@"free_coins_total"] intValue] andTotalCoin:totalCoin];
            [self checkVersion];
        } andBlockFailure:^(id error) {
            // if is first launch and register error
            // app will die
            [self showAlertWithTitle:@"Regiser error, Exits app"];
        }];
        
    } else {
        [self checkVersion];
    }
    
    [indicatorLoading startAnimating];
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
            [fileManager setVersion:checkVersion.version];
            [fileManager setSettingDefault:checkVersion.setting];
            [fileManager setItems:checkVersion.items];
            
            [self loadItemImage:checkVersion.pathFile];
        } else {
            [self presentMainViewController];            
        }
    } andBlockFailure:^(id error) {
        // if not load version
        // Using current version
        NSLog(@"Check version error");
        [self showAlertWithTitle:@"Check version error, Exits app"];
    }];    
}

- (void)loadItemImage:(NSString *)url {
//    dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
//    dispatch_async(myQueue, ^{
//        for (LCItem *item in items) {
//            NSString *stringName = [NSString stringWithFormat:@"%@/%@",HOST_URL, item.pathUrl];
//            NSURL *imageUrl = [NSURL URLWithString:stringName];
//            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
//            [self saveImage:img withFileName:item.name];
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentMainViewController];
//        });
//    });
    LCDownloadTask *downloadTask = [[LCDownloadTask alloc] init];
    downloadTask.URL = url;
    [downloadTask requestWithBlockSucess:^(id sucess) {
        [self presentMainViewController];
        NSLog(@"%@", sucess);
        [SSZipArchive unzipFileAtPath:sucess toDestination:[[LCFileManager shareInstance]documentDirectory]];
    } andBlockFailure:^(id error) {
        
    }];
}

-(void)saveImage:(UIImage *)image withFileName:(NSString *)imageName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *imagePath = [path stringByAppendingPathComponent:imageName];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    [data writeToFile:imagePath atomically:YES];
}

- (void)presentMainViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LCViewController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [mainVC setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:mainVC animated:NO completion:nil];
    
//    [self performSegueWithIdentifier:@"PRESENT_MAIN" sender:self];
}

// Show alert view

- (void)showAlertWithTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Alert Delegate 

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        exit(0);
    }
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
