//
//  ViewController.m
//  BPErrorView
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "ViewController.h"
#import "BPErrorViewController.h"
#import "UIViewController+bpAdding.h"

@interface ViewController ()

- (IBAction)doRefresh:(id)sender;
- (IBAction)doClear:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) BPErrorViewController *errorViewController;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (assign, nonatomic) NSInteger cellCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //init cell count
    self.cellCount = 100;
    
    //init refresh control
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    
    //hide sep line when cell count = 0
    [self.tableView setTableFooterView:[UIView new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doRefresh:(id)sender {
    
    //show cells
    self.cellCount = 100;
    [self.tableView reloadData];
    
    //end refreshing
    if (self.refreshControl.isRefreshing) {
        [self.refreshControl endRefreshing];
    }
}

- (IBAction)doClear:(id)sender {
    
    //clear cells
    self.cellCount = 0;
    [self.tableView reloadData];
}

#pragma mark - TableDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - TableDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //if cell count = 0
    if (self.cellCount == 0) {
        if (self.errorViewController == nil) {
            // init error viewcontroller
            BPErrorViewController *errorVC = [BPErrorViewController errorViewController];
            errorVC.text = @"No data 😄";
            self.errorViewController = errorVC;
        }
        
        // show errorviewController
        [self.errorViewController insertToViewController:self
                                atIndex:0
                                   rect:self.view.bounds
                       autoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
        self.errorViewController.view.layer.zPosition = 1000;

    }else{
        
        //if cell shown, remove error viewController
        [self.errorViewController removeFromViewController:self];
    }
    return self.cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = indexPath.description;
    return cell;
}
@end
