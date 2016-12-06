//
//  WizardWatchTableViewController.m
//  WizardWatch
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "WizardWatchTableViewController.h"
#import "Wizard.h"

@interface WizardWatchTableViewController ()
@property (nonatomic, strong) NSMutableArray *wizardNames;
@end

@implementation WizardWatchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWizards];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) loadWizards
// "void" means that this method does not return nothing, it just performs a job
{
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"wizards" ofType:@"json"];
    // get the path of the groceries.json file in the mainbundle of this application as opposed to somewhere else such as the Supporting files directory.
    NSArray *wizardsJSON =[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error: nil];
    // reads the file located in the "filePath" assuming it is a JSON file
    // NSJSONSerialization a method to verify file type and content as defined in the next method which in this case is JSONObjectWithData to confirm that the file is indeed a JSON file properly formatted
    self.wizardNames = [[NSMutableArray alloc] init];
    for (NSDictionary *aWizardDictionary in wizardsJSON)
        // get the dictionary from groceriesJSON and save it to aDictionary. The aDictionary is a user defined name that could be e.g. mytempdictionary
    {
        Wizard *aWizard = [Wizard aWizardWithDictionary:aWizardDictionary];
        [self.wizardNames addObject:aWizard];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wizardNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AWizardCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Wizard *aWizard = self.wizardNames[indexPath.row];
    cell.textLabel.text = aWizard.name;
    cell.detailTextLabel.text = aWizard.house;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
