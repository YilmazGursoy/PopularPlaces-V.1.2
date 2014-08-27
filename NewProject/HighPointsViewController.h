//
//  HighPointsViewController.h
//  GreatPlaces
//
//  Created by MostWanted on 22/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface HighPointsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *PointOne;
@property (strong, nonatomic) IBOutlet UILabel *PointTwo;
@property (strong, nonatomic) IBOutlet UILabel *PointThree;
@property (nonatomic) NSInteger HighScore;
@property (nonatomic) int Counter;
@property (nonatomic,strong) AVAudioPlayer *musicc;
-(void)HighScoreFunction;
@property (nonatomic) int i;
- (IBAction)ResetHighScore:(UIButton *)sender;
@end
