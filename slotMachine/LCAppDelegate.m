//
//  LCAppDelegate.m
//  slotMachine
//
//  Created by Le Cong on 12/14/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCAppDelegate.h"
#import "LCConstant.h"

@implementation LCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self CopyFile];
    
    NSMutableDictionary *dictDefault = [self readDict];
    BOOL __block isFirstLaunch = [dictDefault[kIsFirstlaunch] boolValue];
    if (isFirstLaunch) {
        
        LCRegisterTask *registerTask = [[LCRegisterTask alloc] initWithDeviceID:[Utils getUniqueDeviceIdentifierAsString]];
        [registerTask requestWithBlockSucess:^(id sucess) {
            [self saveDictfile:dictDefault WithBool:isFirstLaunch];
        } andBlockFailure:^(id error) {
            
        }];
        
    }
    
    return YES;
}

- (void)saveDictfile:(NSMutableDictionary *)dictDefault WithBool:(BOOL)isFirstLaunch {
    isFirstLaunch = false;
    [dictDefault setObject:[NSNumber numberWithBool:isFirstLaunch] forKey:kIsFirstlaunch];
    [dictDefault writeToFile:[self filePath] atomically:YES];
}

- (NSMutableDictionary *)readDict{
    NSMutableDictionary *contentDict = [NSMutableDictionary dictionaryWithContentsOfFile:[self filePath]];
    return contentDict;
}

- (NSString*)filePath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentDir = [Paths objectAtIndex:0];
    return [DocumentDir stringByAppendingPathComponent:kDefaultFileName];
}

- (void)CopyFile
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:[self filePath]];
    NSString *BundleFile = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:kDefaultFileName];
    if (success)
    {
        NSLog(@"File Exist");
        return;
    }
    else
    {
        [fileManager copyItemAtPath:BundleFile toPath:[self filePath] error:nil];
    }
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
