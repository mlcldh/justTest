//
//  Person.h
//  MengTodayExtension
//
//  Created by menglc on 16/4/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

- (void)work;

@end

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *job;
@property (nonatomic,copy)NSString *native;
@property (nonatomic,copy)NSString *education;

@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)double height;

@property (nonatomic,assign)id<PersonDelegate> delegate;

- (void)eat;
- (void)sleep;
- (void)work;

@end
