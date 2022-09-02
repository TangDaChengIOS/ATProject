//
//  ViewController.m
//  ATProject
//
//  Created by 汤达成 on 2022/9/2.
//

#import "ViewController.h"
//#import "ATKVOControl.h"

typedef NS_ENUM(NSInteger,ATJumpType) {
    ATJumpType_KVO = 0,
    ATJumpType_Timer
};

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];
}

- (void)setSubViews {
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell_List" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.textLabel.text = [self stringForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self jumpControlWithRow:indexPath.row];
}

- (void)jumpControlWithRow:(NSInteger)row {
    NSString * clsName;
    switch (row) {
        case ATJumpType_KVO:
            clsName = @"ATKVOControl";
            break;
        case ATJumpType_Timer:
            clsName = @"";
            break;
        default:
            break;
    }
    if (clsName && clsName.length > 0) {
        Class cls = NSClassFromString(clsName);
        UIViewController *control = [[cls alloc]init];
        control.modalPresentationStyle = UIModalPresentationFullScreen;
        control.modalPresentationCapturesStatusBarAppearance = NO;
        [self presentViewController:control animated:YES completion:nil];
    }
}

- (NSString *)stringForRow:(NSInteger)row {
    switch (row) {
        case ATJumpType_KVO:
            return @"KVO";
            break;
        case ATJumpType_Timer:
            return @"Timer";
            break;
        default:
            return @"";
            break;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell_List"];
        _tableView.rowHeight = 50;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"KVO",@"Timer"];
    }
    return _dataSource;
}

@end
