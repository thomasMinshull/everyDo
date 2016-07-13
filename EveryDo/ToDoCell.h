//
//  toDoCell.h
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class ToDoCell;

@protocol UpdateToDoCellDelegate <NSObject>

- (void)updateToDoCell:(ToDoCell *)cell;

@end

@interface ToDoCell : UITableViewCell

@property (weak, nonatomic) id<UpdateToDoCellDelegate> delegate;

-(void)configureCellwithToDo:(ToDo *)toDo;

@end
