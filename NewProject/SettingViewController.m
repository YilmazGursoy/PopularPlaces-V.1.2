//
//  SettingViewController.m
//  GreatPlaces
//
//  Created by MostWanted on 20/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(!self.Viewcontroller){
        self.Viewcontroller=[[ViewController alloc]init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)Switch:(UISwitch *)sender {
    if(![self.SwitchOutlet isOn]){
        [((AppDelegate *)([UIApplication sharedApplication].delegate)).self.BackGroundMusic pause];
    }
    else{
        [((AppDelegate *)([UIApplication sharedApplication].delegate)).self.BackGroundMusic play];
    }
    
    
}
- (IBAction)SaveButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
