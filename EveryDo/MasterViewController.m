//
//  MasterViewController.m
//  EveryDo
//
//  Created by thomas minshull on 2016-07-12.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    ToDo *td1, *td2, *td3, *td4, *td5;
    
    td1 = [ToDo new];
    td2 = [ToDo new];
    td3 = [ToDo new];
    td4 = [ToDo new];
    td5 = [ToDo new];
    
    td1.title = @"Hello World";
    td1.toDoDescription = @"Wear sunscrean, the rest of my advice...";
    td1.priority = 1;
    td1.completed = false;
    
    td2.title = @"Good Bye World";
    td2.toDoDescription = @"I hurt my self today, to prove that I still feel. I focused on the pain the only thing that's real";
    td2.priority = 2;
    td2.completed = TRUE;
    
    td3.title = @"foo";
    td3.toDoDescription = @"Bar bar bar bar bar bar";
    td3.priority = 1;
    td3.completed = false;
    
    td4.title = @"Run to the hills";
    td4.toDoDescription = @"Run for your LIIIIIFFEEE";
    td4.priority = 1;
    td4.completed = TRUE;
    
    td5.title = @"Ziggy";
    td5.toDoDescription = @"This is ground control to major Tom's";
    td5.priority = 1;
    td5.completed = false;
    
    
    self.objects = [@[td1, td2, td3, td4, td5] mutableCopy];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 114.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    [self performSegueWithIdentifier:@"NewToDoSegue" sender:self];
}

- (void)newToDoCreated:(ToDo *)todo {
    [self.objects addObject:todo];
    [self.tableView reloadData];
}


#pragma mark - UpdateToDoCellDelegate Methods 

- (void)updateToDoCell:(ToDoCell *)cell {
    NSIndexPath *updatedCellIP = [self.tableView indexPathForCell:cell];
    [self.tableView reloadRowsAtIndexPaths:@[updatedCellIP] withRowAnimation:UITableViewRowAnimationRight];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"NewToDoSegue"]) {
        NewToDoViewController *controller = (NewToDoViewController *)[segue destinationViewController];
        controller.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configureCellwithToDo:self.objects[indexPath.row]];
    
    cell.delegate = self;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
