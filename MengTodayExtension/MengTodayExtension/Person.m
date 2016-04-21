//
//  Person.m
//  MengTodayExtension
//
//  Created by menglc on 16/4/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "Person.h"

#import <objc/runtime.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int cout;
    objc_property_t *properties = class_copyPropertyList(self.class, &cout);
    for (int i = 0; i < cout; i ++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        id propertyValue = [self valueForKey:propertyName];
        [aCoder encodeObject:propertyValue forKey:propertyName];
//        NSLog(@"%@",propertyName);
    }
    free(properties);
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int cout;
    objc_property_t *properties = class_copyPropertyList(self.class, &cout);
    for (int i = 0; i < cout; i ++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        NSString *propertyValue = [aDecoder decodeObjectForKey:propertyName];
        [self setValue:propertyValue forKey:propertyName];
//        NSLog(@"%@",propertyName);
    }
    free(properties);
    
    return self;
}

- (void)eat
{
    
}

- (void)sleep
{
    
}

- (void)work
{
    
}

@end
