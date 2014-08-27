//
//  FirstScreenViewController.h
//  GreatPlaces
//
//  Created by MostWanted on 20/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol MusicCheck<NSObject>
@required
-(void)CheckMusic;
-(void)FirstMusic;
@end
@interface FirstScreenViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *StartButton;
@property (nonatomic,strong)    AVAudioPlayer *backGroundSound;
@end
