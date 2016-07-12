//
//  toDoCell.h
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ToDoCell : UITableViewCell

-(void)configureCellwithToDo:(ToDo *)toDo;

@end
