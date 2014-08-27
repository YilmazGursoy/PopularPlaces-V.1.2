//
//  SettingViewController.h
//  GreatPlaces
//
//  Created by MostWanted on 20/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface SettingViewController : ViewController
@property (nonatomic, strong) ViewController *Viewcontroller;
- (IBAction)Switch:(UISwitch *)sender;
@property (strong, nonatomic) IBOutlet UISwitch *SwitchOutlet;
- (IBAction)SaveButton:(UIButton *)sender;


@end
