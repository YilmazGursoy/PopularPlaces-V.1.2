//
//  MasterViewController.h
//  Yilmaz
//
//  Created by MostWanted on 16/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
