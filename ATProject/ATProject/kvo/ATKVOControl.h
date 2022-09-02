//
//  ATKVOControl.h
//  ATProject
//
//  Created by 汤达成 on 2022/9/2.
//

#import "ATBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATKVOControl : ATBaseViewController

@end

@interface ATObserveObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
