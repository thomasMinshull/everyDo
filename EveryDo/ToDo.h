//
//  ToDo.h
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *toDoDescription;
@property (assign, nonatomic) int priority;
@property (assign, nonatomic, getter=isCompleted) BOOL completed;

@end
