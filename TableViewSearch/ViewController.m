//
//  ViewController.m
//  TableViewSearch
//
//  Created by Phu Huynh on 8/31/15.
//  Copyright (c) 2015 Plato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize arrayItems;
@synthesize filterItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize data for item array.
    arrayItems = [[NSArray alloc] initWithObjects:@"Apple", @"Samsung", @"HTC", @"Moto", nil];
    
    filterItems = [[NSArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Datasource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return [self.filterItems count];
    }else{
        return [self.arrayItems count];
    }
    // return [self.arrayItems count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentify = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView){
        cell.textLabel.text = [self.filterItems objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.arrayItems objectAtIndex:indexPath.row];
    }
    //cell.textLabel.text = [self.arrayItems objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)filterForSearchText:(NSString*) searchText scope:(NSString*) scope{
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SElF beginswith[c] %@", searchText];
    filterItems = [arrayItems filteredArrayUsingPredicate:predicate];
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterForSearchText:searchString scope:nil];
    return YES;
}

@end
