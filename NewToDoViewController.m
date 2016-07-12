//
//  NewToDoViewController.m
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "NewToDoViewController.h"

@interface NewToDoViewController ()

@property (strong, nonatomic) ToDo *toDo;

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;


@end

@implementation NewToDoViewController

- (void)viewWillAppear:(BOOL)animated {
    self.toDo = [ToDo new];
}

- (IBAction)addTapped:(id)sender {
    if([self setToDoValues]) {
        [self.delegate newToDoCreated:self.toDo];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        self.errorLabel.hidden = NO;
    }
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -arguements

- (BOOL)setToDoValues {
    self.toDo.title = self.titleTextField.text;
    self.toDo.toDoDescription = self.descriptionTextField.text;
    int priority = [self.priorityTextField.text intValue];
    
    if (priority == 0) { // 0 isn't a priority, intValue will be 0.0 for many invalid cases
        return NO;
    } else {
        self.toDo.priority = priority;
    }
    
    return YES;
}

@end
