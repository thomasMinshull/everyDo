//
//  NewToDoViewController.h
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol NewToDoDelegate <NSObject>

- (void)newToDoCreated:(ToDo *)todo;

@end

@interface NewToDoViewController : UIViewController

@property (weak, nonatomic) id<NewToDoDelegate> delegate;

@end
