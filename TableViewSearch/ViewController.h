//
//  ViewController.h
//  TableViewSearch
//
//  Created by Phu Huynh on 8/31/15.
//  Copyright (c) 2015 Plato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property NSArray * arrayItems;
@property NSArray * filterItems;

@end

