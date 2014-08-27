//
//  DetailViewController.h
//  Yilmaz
//
//  Created by MostWanted on 16/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
