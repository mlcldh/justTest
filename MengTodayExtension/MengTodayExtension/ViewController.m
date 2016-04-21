//
//  ViewController.m
//  MengTodayExtension
//
//  Created by menglc on 16/2/22.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>

#import "Person.h"

@interface ViewController ()


@property (strong, nonatomic) IBOutlet UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[NSUserDefaults standardUserDefaults]setObject:@"hehe" forKey:@"nothing"];
//    [self getMethods];
//    [self getProtocols];
    [self saveData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (IBAction)buttonAction:(UIButton *)sender {
    
}

#pragma mark -

- (void)getVars
{
    unsigned int cout;
    Ivar *ivars = class_copyIvarList(objc_getClass("LSApplicationWorkspace"), &cout);
    for (int i = 0; i < cout; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",ivarName);
    }
    free(ivars);
}

- (void)getPropertys
{
    unsigned int cout;
    objc_property_t *properties = class_copyPropertyList(objc_getClass("LSApplicationWorkspace"), &cout);
    for (int i = 0; i < cout; i ++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",propertyName);
    }
    free(properties);
}

- (void)getMethods
{
    unsigned int cout;
    Method *methods = class_copyMethodList(objc_getClass("LSApplicationWorkspace"), &cout);
    for (int i = 0; i < cout; i ++) {
        Method method = methods[i];
        SEL methodSEL = method_getName(method);
        const char *name = sel_getName(methodSEL);
        NSString *methodName = [NSString stringWithUTF8String:name];
        int arguments = method_getNumberOfArguments(method);
        NSLog(@"%@,%d",methodName,arguments);
    }
    free(methods);
}

- (void)getProtocols
{
    unsigned int cout;
    __unsafe_unretained Protocol **protocols = class_copyProtocolList(objc_getClass("UITableView"), &cout);
    for (int i = 0; i < cout; i ++) {
        Protocol *protocol = protocols[i];
        const char *name = protocol_getName(protocol);
        NSString *protocolName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",protocolName);
    }
    free(protocols);
}

#pragma mark -

- (NSString *)path
{
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/archive"];
    
    return path;
}

- (void)saveData
{
    Person *person = [[Person alloc]init];
    person.name = @"james";
    person.sex = @"male";
    person.job = @"basketball player";
    person.native = @"US";
    person.education = @"high school";
    
    person.age = 31;
    person.height = 2.03;
    
    BOOL ok = [NSKeyedArchiver archiveRootObject:person toFile:self.path];
    
}

- (void)readData
{
    Person *person2 = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
}

@end
