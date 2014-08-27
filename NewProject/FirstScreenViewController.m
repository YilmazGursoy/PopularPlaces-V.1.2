//
//  FirstScreenViewController.m
//  GreatPlaces
//
//  Created by MostWanted on 20/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "ViewController.h"
@interface FirstScreenViewController ()<MusicCheck>

@end

@implementation FirstScreenViewController

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
    ViewController *cont=[[ViewController alloc]init];
    // Do any additional setup after loading the view.
    NSString *background=[[NSBundle mainBundle]pathForResource:@"BackGround" ofType:@"mp3"];
    NSURL *newURL = [NSURL fileURLWithPath:background];
    
   

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
-(void)CheckMusic{
    NSLog(@"Hellooo");

}
-(void)FirstMusic{

}
@end
