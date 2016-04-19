//
//  UIViewController+ExchangeImplementation.m
//  MengTodayExtension
//
//  Created by menglc on 16/4/13.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "UIViewController+ExchangeImplementation.h"

#import <objc/runtime.h>

//pod 'Aspects', '~> 1.4.1'

typedef id (*_IMP)(id,SEL, ...);

@implementation UIViewController (ExchangeImplementation)

//+ (void)load
//{
//    static dispatch_once_t oneToken;
//    dispatch_once(&oneToken, ^{
//        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
//        Method viewDidLoaded = class_getInstanceMethod(self, @selector(viewDidLoaded));
//        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
//    });
//}

+ (void)load
{
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        Method formerMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
        _IMP method_IMP = (_IMP)method_getImplementation(formerMethod);
        method_setImplementation(formerMethod, imp_implementationWithBlock(^(id target,SEL action){
            method_IMP(target,@selector(viewDidLoad));
            NSLog(@"%@ did load",self);
        }));
    });
}

//- (void)viewDidLoaded
//{
//    // 调用自己原有的方法
//    [self viewDidLoaded];
//    
//    NSLog(@"%@ did load",self);
//}

@end
