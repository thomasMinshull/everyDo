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


@property (weak, nonatomic) ToDo *toDo;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation ToDoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(updatedCompletedStatus:)];
    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.contentView addGestureRecognizer:swipeGesture];
}

- (void)configureCellwithToDo:(ToDo *)toDo {
    self.toDo = toDo;
    self.titleLabel.text = toDo.title;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d", toDo.priority];
    
    NSAttributedString *descriptionString;
    NSDictionary *attributes;
    if (toDo.isCompleted) {
        attributes = @{
                       NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                     };
    } else {
        attributes = @{};
    }
    descriptionString = [[NSAttributedString alloc] initWithString:toDo.toDoDescription attributes:attributes];
    
    [self.descriptionLabel setAttributedText:descriptionString];
}

- (void)updatedCompletedStatus:(UISwipeGestureRecognizer *)sender {
    if (self.toDo.isCompleted) {
        self.toDo.completed = NO;
    } else {
        self.toDo.completed = YES;
    }
    
    [self.delegate updateToDoCell:self];
}

@end
