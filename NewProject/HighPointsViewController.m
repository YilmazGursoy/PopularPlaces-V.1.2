//
//  HighPointsViewController.m
//  GreatPlaces
//
//  Created by MostWanted on 22/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "HighPointsViewController.h"
@interface HighPointsViewController ()

@end

@implementation HighPointsViewController

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
    self.i=0;
    NSString *song=[[NSBundle mainBundle]pathForResource:@"HighScoreSong" ofType:@"mp3"];
    self.musicc=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:song] error:NULL];
    self.HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    self.PointOne.text=[NSString stringWithFormat:@"%li",(long)self.HighScore];
    self.musicc.volume=0.5;
    self.Counter=0;
    // Do any additional setup after loading the view.
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(HighScoreFunction) userInfo:nil repeats:YES];
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
-(void)HighScoreFunction{
    self.Counter++;
    if(self.HighScore>45){
        if((self.HighScore-self.Counter)<40){
            if(self.i==0){
                [self.musicc play];
                self.i=1;
            }
            
            
        }
    }
    
        if(self.Counter<=self.HighScore){
        self.PointOne.text=[NSString stringWithFormat:@"%i",self.Counter];
    }
    else{
        self.PointOne.text=[NSString stringWithFormat:@"%li",(long)self.HighScore];
    }
}

- (IBAction)ResetHighScore:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"HighScore"];
    self.HighScore=0;
}

@end
