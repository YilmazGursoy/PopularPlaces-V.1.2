//
//  ViewController.h
//  NewProject
//
//  Created by MostWanted on 04/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Places.h"
#import "FirstScreenViewController.h"
@interface ViewController : UIViewController
@property (nonatomic,strong)    AVAudioPlayer *backGroundSound;
//Buradakiler dogru cevap şıkkından sonra geriye kalan 3 tane sıkkın ataması;
@property (nonatomic,strong)    AVAudioPlayer *nextSong;
@property (nonatomic) int HighScores;
@property (nonatomic,strong)    AVAudioPlayer *gameOverSong;
@property (nonatomic,strong)    AVAudioPlayer *passSong;
@property (nonatomic, strong) NSTimer *MusicTimer;
@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic) int WatchValue;
@property (nonatomic) int thirdNumber;
@property (strong,nonatomic) NSArray *array;//Bu array 
@property (strong,nonatomic) NSArray *AnotherButton;
@property (nonatomic)int passCount;
@property (nonatomic) int count;
@property (nonatomic)int value;
- (IBAction)ExitButton:(UIButton *)sender;
@property (nonatomic) int pointNumber;
//Buradakiler star ve heart saılarını donduren ve onları gerektiklerinde artırım azaltan yapılardırr;
-(void)CheckStar;
-(void)CheckHearth;
//Buradakiler arrayler bu star ve hearth imageViewlarının depolandıgı arrayler digerleride Control statement;
@property (nonatomic)int BoolStar;
@property (nonatomic,strong) NSMutableArray *BOOLstar;
@property (nonatomic,strong)NSMutableArray *BOOLHearth;
@property (strong, nonatomic) IBOutlet UIButton *Startt;
@property (strong, nonatomic) IBOutlet UIButton *StartButton;
@property (nonatomic)int BoolHearth;
//Soruda he basıldıgında farklı bir sorudan başlaması için onları karıştıran ve gelen rand degeri kendine depolayan yapı
@property (nonatomic,strong)NSMutableArray *randImages;
-(void)Timer;
-(void)set_imageView;//ImageView a resim atama fonksiyonu

-(BOOL)is_Equal:(NSString*)string;//İçine aldıgı deger ile sender.currenttittle ı karşılaştırma fonksiyonu BOOL tipinde
-(NSMutableArray*)RandomImages;//Soruların rasggele karışmasını saglayan yapı;Dondurdugu tip ile belli bir aralıktaki rand sayıları içine depolayıp onun arrayyini döndürüyor

@property (nonatomic,strong) Places *places;//Herşeyin başı bu :)
//ImageView'lar
@property (strong, nonatomic) IBOutlet UIImageView *hearthOne;
@property (strong, nonatomic) IBOutlet UILabel *FirstPoint;
@property (strong, nonatomic) IBOutlet UIImageView *hearthTwo;
@property (strong, nonatomic) IBOutlet UIImageView *hearthThree;

@property (strong, nonatomic) IBOutlet UIImageView *starOne;
@property (strong, nonatomic) IBOutlet UIImageView *starTwo;
@property (strong, nonatomic) IBOutlet UIImageView *starThree;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *ImageView;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UITextField *textView;//Bu geliştirilmeden onceki prototype aşamasında iken düşündügüm birşeydi

//Tkrar baslamayı saglayan yapıdır;
@property (strong, nonatomic) IBOutlet UIButton *restartButton;
@property (strong, nonatomic) IBOutlet UIButton *actionRestartButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButtonOutlet;
- (IBAction)infoButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *pointLabel;
//Buttonlar ve buttonların hepsini sender yapısı kullanabilmek için atama yaptıgım UIButton tipindeki Button;
@property (strong, nonatomic) IBOutlet UIButton *buttonA;
- (IBAction)Button:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonB;
@property (strong, nonatomic) IBOutlet UIButton *buttonC;
@property (strong, nonatomic) IBOutlet UIButton *buttonD;
-(NSMutableArray*)RandomNumbers;
- (IBAction)ActionButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *Buttonstart;
-(void)CheckCount:(int)value;
- (IBAction)ButtonStart:(id)sender;
-(BOOL)CheckChoose;
-(void)Start;//Başlangıç için gereken hidden yapılarının atamasını yapan fonksiyon;
-(void)Finish;//Bu da bitiş için gene aynı şekilde hidden atamalarını yapan fonksiyon;
@end
