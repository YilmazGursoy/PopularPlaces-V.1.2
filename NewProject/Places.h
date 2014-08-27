//
//  Places.h
//  NewProject
//
//  Created by MostWanted on 04/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Places : NSObject
-(NSArray*)Place;
@property (nonatomic,strong) NSString *name;
@property (strong) UIImage *image;
@property (nonatomic) int point;
@property (nonatomic,strong) NSString *info;
@end
