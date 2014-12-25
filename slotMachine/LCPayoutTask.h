//
//  LCPayoutTask.h
//  
//
//  Created by Le Cong on 12/26/14.
//
//

#import "LCBaseTaskNetWork.h"

@interface LCPayoutTask : LCBaseTaskNetWork

- (id)initWithPayoutAccount:(NSString *)account andAmount:(CGFloat )amount;

@end
