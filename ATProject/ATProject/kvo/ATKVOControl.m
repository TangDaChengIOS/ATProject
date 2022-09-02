//
//  ATKVOControl.m
//  ATProject
//
//  Created by 汤达成 on 2022/9/2.
//

#import "ATKVOControl.h"

@interface ATKVOControl ()
@property (nonatomic, strong) ATObserveObject *aObject;
@property (nonatomic, strong) ATObserveObject *bObject;
@end

@implementation ATKVOControl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"KVO";
    [self testObserve];
 }

- (void)testObserve {
    _aObject = [ATObserveObject new];
    _bObject = [ATObserveObject new];
    [_aObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    _aObject.name = @"hello";
    
    [_bObject addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    _bObject.age = 18;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
}


@end


@implementation ATObserveObject

//-(void)setName:(NSString *)name {
//    [self willChangeValueForKey:name];
//    _name = name;
//    [self didChangeValueForKey:name];
//}

@end
