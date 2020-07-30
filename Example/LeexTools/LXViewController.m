//
//  LXViewController.m
//  LeexTools
//
//  Created by leex_ios@163.com on 07/30/2020.
//  Copyright (c) 2020 leex_ios@163.com. All rights reserved.
//

#import "LXViewController.h"
#import <LeexTools.h>
@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [LXNetWork openLog];
//    [self testNormal];
    [self testCache];
	// Do any additional setup after loading the view, typically from a nib.
}
//无缓存
- (void)testNormal
{
    [LXNetWork GET:@"https://chain.api.btc.com/v3/address/1FhGhbZoB3m3Z872r3pcaURXhc7xqpoVEx/unspent" parameters:@{} headers:@{} success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

//缓存（第一次缓存为空 第二次调用才会有缓存）
- (void)testCache
{
    [LXNetWork GET:@"https://chain.api.btc.com/v3/address/1FhGhbZoB3m3Z872r3pcaURXhc7xqpoVEx/unspent" parameters:@{} headers:@{} responseCache:^(id responseCache) {
        
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
