//
//  toDoCell.m
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "ToDoCell.h"
#import "ToDo.h"

@interface ToDoCell ()


@property (strong, nonatomic) ToDo *toDo;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation ToDoCell

- (void)configureCellwithToDo:(ToDo *)toDo {
    self.titleLabel.text = toDo.title;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d", toDo.priority];
    
    NSAttributedString *descriptionString;
    NSDictionary *attributes;
    if (toDo.isCompleted) {
        attributes = @{
                       NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                     };
//        descriptionString = [[NSAttributedString alloc] initWithString:toDo.toDoDescription attributes:attributes];
    } else {
        attributes = @{};
//        descriptionString = [[NSAttributedString alloc] initWithString:toDo.toDoDescription
    }
    descriptionString = [[NSAttributedString alloc] initWithString:toDo.toDoDescription attributes:attributes];
    
    [self.descriptionLabel setAttributedText: descriptionString];
}

@end
