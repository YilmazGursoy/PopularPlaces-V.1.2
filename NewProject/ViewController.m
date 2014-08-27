//
//  ViewController.m
//  NewProject
//
//  Created by MostWanted on 04/08/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "ViewController.h"
#import "Places.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize buttonA,buttonB,buttonC,buttonD,AnotherButton,firstNumber,secondNumber,thirdNumber,count,hearthOne,hearthTwo;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.HighScores=0;
    self.passCount=0;
    self.count=0;
    self.value=0;
    self.WatchValue=0;
    NSString *nextsong=[[NSBundle mainBundle]pathForResource:@"Next" ofType:@"mp3"];
    self.nextSong=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:nextsong] error:NULL];
    
    NSString *gameover=[[NSBundle mainBundle]pathForResource:@"GameOver" ofType:@"mp3"];
    self.gameOverSong=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:gameover] error:NULL];
    
    
    NSString *Pass=[[NSBundle mainBundle]pathForResource:@"Pass" ofType:@"mp3"];
    self.passSong=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:Pass] error:NULL];
    
    NSString *background=[[NSBundle mainBundle]pathForResource:@"BackGround" ofType:@"mp3"];
    NSURL *newURL = [NSURL fileURLWithPath:background];
	// Do any additional setup after loading the view, typically from a nib.

    self.places=[[Places alloc]init];
    AnotherButton=[[NSArray alloc]initWithObjects:@"Naica Mine, Mexico",@"Yew Tree,West Wales",@"Antelope Canyon, Arizona",@"Aogashima Volcano, Japan",@"Awesome Flower Street",@"Bahamas, Copperfield Bay",@"Bamboo Forest, Japan",@"Beachy Head – England",@"Castillo de La Cueva, Spain",@"Cherry Blossoms, Germany",@"Chittorgarh Fort, India",@"Cinque Terre, Italy",@"Fairy Pools, Scotland",@"Galapagos Islands",@"Galápagos Islands South America",@"Giant’s Causeway, Ireland",@"Glass Beach, USA",@"Glow worm cave, New Zealand",@"Great Blue Hole, Belize",@"Hiller lake, Australia",@"Hitachi Seaside Park, Japan",@"Hotel La Montana Magica",@"Hvitserkur North Iceland",@"Ice hotel, Norway",@"Magic Forest in Shanghai",@"Mendenhall Ice Caves, Alaska",@"Mount Ararat eruption",@"Pamukkale, Turkey",@"Panjin RedBeach, China",@"Petra, Jordan",@"Piano Bridge,China",@"Red Beach, China",@"Ruby Falls, Tennessee",@"Santorini, Greece",@"Sea Cave, Malta",@"Sea Cliffs, France",@"Shifen Waterfall",@"Split Pinnacle , Hunan China",@"St. Lucia",@"Stairway to Heaven, Iceland",@"Taj Mahal, India",@"The cliffs of Etretat, France",@"Tulip Flower Fields in Netherlands",@"Tuscany, Italy",@"Valley of Ten Peaks",@"Venice, Italy",@"Wind Cathedral Namibia",@"Yosemite National Park",@"Big Island, USA",@"Fingal’s Cave, Scotland",@"Ha Long Bay, Vietnam",@"Neuschwanstein Castle, Germany",@"Salar de Uyuni, Bolivia", nil];
    [self Start];
    self.BOOLstar=[[NSMutableArray alloc]initWithObjects:self.starOne,self.starTwo,self.starThree, nil];
    self.BoolStar=0;
    self.BoolHearth=0;
    self.BOOLHearth=[[NSMutableArray alloc]initWithObjects:self.hearthOne,self.hearthTwo,self.hearthThree, nil];
    self.array=[[NSArray alloc]init];
    self.pointLabel.text=[NSString stringWithFormat:@"%i",self.pointNumber*10];
    self.array=[self.places Place];
    self.randImages=[[NSMutableArray alloc]init];
    self.randImages=[self RandomImages];
    [self set_imageView];
    [self ButtonNameSet];
    
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)okButton:(id)sender {
}
- (IBAction)infoButton:(id)sender {
    if(self.passCount>2){
        Places *namePlaces=[[Places alloc]init];
        
        namePlaces=[self.array objectAtIndex:[[self.RandomImages objectAtIndex:count]integerValue]];
        NSString *info=[[NSString alloc]init];
        info=namePlaces.info;
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Sorry!" message:@"There's no hint!" delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
        self.infoButtonOutlet.hidden=YES;
        [alertView show];
        self.passSong.volume=0.2;
        [self.passSong play];
    }
    else{
        self.buttonA.hidden=NO;
        self.buttonB.hidden=NO;
        self.buttonC.hidden=NO;
        self.buttonD.hidden=NO;
            self.passSong.volume=0.2;
        [self.passSong play];
        [self set_imageView];
        [self ButtonNameSet];
        self.passCount++;
        
    }
    self.BoolStar++;
    [self CheckStar];

}
- (IBAction)Button:(UIButton *)sender {
    buttonA.hidden=NO;
    buttonB.hidden=NO;
    buttonC.hidden=NO;
    buttonD.hidden=NO;
    
    NSString *string=sender.currentTitle;

    BOOL aa=[self is_Equal:string];

    if(aa){
        
        [self set_imageView];
        [self ButtonNameSet];
        self.pointNumber++;
        self.pointLabel.text=[NSString stringWithFormat:@"%i",self.pointNumber*10];
        self.WatchValue++;
    }
    else{
        
        self.BoolHearth++;
        [self CheckHearth];
    }
}
-(void)ButtonNameSet{
    
    self.HighScores++;
    NSMutableArray *RandomNumber=[[NSMutableArray alloc]init];
    RandomNumber=[self RandomNumbers];
    int rand=arc4random()%3+0;
    Places *namePlaces=[[Places alloc]init];
    namePlaces=[self.array objectAtIndex:[[self.randImages objectAtIndex:count]integerValue]];
    NSString *name=[[NSString alloc]init];
    name=namePlaces.name;
    firstNumber=[[RandomNumber objectAtIndex:0]integerValue];
    secondNumber =[[RandomNumber objectAtIndex:1]integerValue];
    thirdNumber=[[RandomNumber objectAtIndex:2]integerValue];
    if(rand==0){
    [buttonA setTitle:name forState:UIControlStateNormal];
    [buttonB setTitle:[AnotherButton objectAtIndex:firstNumber] forState:UIControlStateNormal];
    [buttonC setTitle:[AnotherButton objectAtIndex:secondNumber] forState:UIControlStateNormal];
    [buttonD setTitle:[AnotherButton objectAtIndex:thirdNumber] forState:UIControlStateNormal];
        if([self CheckChoose]){
            [self ButtonNameSet];
        }
        else{
            self.count++;
            [self CheckCount:self.count];

        }
    }
    else if (rand==1){
        [buttonB setTitle:name forState:UIControlStateNormal];
        [buttonA setTitle:[AnotherButton objectAtIndex:firstNumber] forState:UIControlStateNormal];
        [buttonC setTitle:[AnotherButton objectAtIndex:secondNumber] forState:UIControlStateNormal];
        [buttonD setTitle:[AnotherButton objectAtIndex:thirdNumber] forState:UIControlStateNormal];
        if([self CheckChoose]){
            [self ButtonNameSet];
        }
        else{
            self.count++;
            [self CheckCount:self.count];
        }
        
    }
    else if (rand==2){
        [buttonC setTitle:name forState:UIControlStateNormal];
        [buttonB setTitle:[AnotherButton objectAtIndex:firstNumber] forState:UIControlStateNormal];
        [buttonA setTitle:[AnotherButton objectAtIndex:secondNumber] forState:UIControlStateNormal];
        [buttonD setTitle:[AnotherButton objectAtIndex:thirdNumber] forState:UIControlStateNormal];
        if([self CheckChoose]){
            [self ButtonNameSet];
        }
        else{
            self.count++;
            [self CheckCount:self.count];

        }
    }
    else if (rand==3){
        [buttonD setTitle:name forState:UIControlStateNormal];
        [buttonB setTitle:[AnotherButton objectAtIndex:firstNumber] forState:UIControlStateNormal];
        [buttonC setTitle:[AnotherButton objectAtIndex:secondNumber] forState:UIControlStateNormal];
        [buttonA setTitle:[AnotherButton objectAtIndex:thirdNumber] forState:UIControlStateNormal];
        if([self CheckChoose]){
            [self ButtonNameSet];
        }
        else{  self.count++;
            [self CheckCount:self.count];
        }
    }
   

    }
-(NSMutableArray*)RandomNumbers {

    NSMutableArray *uniqueNumbers =[[NSMutableArray alloc] init];
    int r;
    while ([uniqueNumbers count] < 3) {
        r = arc4random() % 53; // ADD 1 TO GET NUMBERS BETWEEN 1 AND M RATHER THAN 0 and M-1
        if (![uniqueNumbers containsObject:[NSNumber numberWithInt:r]]) {
            [uniqueNumbers addObject:[NSNumber numberWithInt:r]];
        }
    }
    return uniqueNumbers;
}

- (IBAction)ActionButton:(UIButton *)sender {
    self.pointNumber=0;
    [self Start];
    [self viewDidLoad];

}
-(BOOL)is_Equal:(NSString*)string{
    Places *namePlaces=[[Places alloc]init];
    namePlaces=[self.array objectAtIndex:[[self.randImages objectAtIndex:count-1]integerValue]];
    NSString *name=[[NSString alloc]init];
    name=namePlaces.name;
    if([string isEqualToString:name]){
        [self.nextSong setVolume:0.3];
        [self.nextSong play];
        
        return YES;
    }
    else{
        [self.gameOverSong setVolume:0.4];
        [self.gameOverSong play];
        return NO;
    }
}
-(void)set_imageView{

    Places *namePlaces=[[Places alloc]init];
    namePlaces=[self.array objectAtIndex:[[self.randImages objectAtIndex:count]integerValue]];
    self.imageview.image=namePlaces.image;

    
    
}
-(void)CheckCount:(int)value{
     if(self.count>=53){
        UIAlertView *finish=[[UIAlertView alloc]initWithTitle:@"Finish" message:[NSString stringWithFormat:@"Congratulations!! \nYour point is : %i",self.pointNumber*10] delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
        [finish show];
         [self dismissViewControllerAnimated:YES completion:NULL];
        [self viewDidLoad];
    }
}
-(NSMutableArray*)RandomImages{
    NSMutableArray *uniqueNumbers =[[NSMutableArray alloc] init];
    int r;
    while ([uniqueNumbers count] < 53) {
        r = arc4random()%53;
        if (![uniqueNumbers containsObject:[NSNumber numberWithInt:r]]) {
            [uniqueNumbers addObject:[NSNumber numberWithInt:r]];
        }
    }
    return uniqueNumbers;
}
-(void)CheckStar{
    if(self.BoolStar==0){
            self.starOne.hidden=NO;
            self.starTwo.hidden=NO;
            self.starThree.hidden=NO;
    }
    else if (self.BoolStar==1){
            self.starOne.hidden=YES;
            self.starTwo.hidden=NO;
            self.starThree.hidden=NO;
    
    }
    else if (self.BoolStar==2){
            self.starOne.hidden=YES;
            self.starTwo.hidden=YES;
            self.starThree.hidden=NO;
        }
    else{
            self.starOne.hidden=YES;
            self.starTwo.hidden=YES;
            self.starThree.hidden=YES;
        
    }
}
-(void)CheckHearth{
    
    if(self.BoolHearth==0){
        self.hearthOne.hidden=NO;
        self.hearthTwo.hidden=NO;
        self.hearthThree.hidden=NO;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"It's False!" message:nil delegate:nil cancelButtonTitle:@"Again" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if (self.BoolHearth==1){
        self.hearthOne.hidden=YES;
        self.hearthTwo.hidden=NO;
        self.hearthThree.hidden=NO;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"It's False!" message:nil delegate:nil cancelButtonTitle:@"Again" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if (self.BoolHearth==2){
        self.hearthOne.hidden=YES;
        self.hearthTwo.hidden=YES;
        self.hearthThree.hidden=NO;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"It's False!" message:nil delegate:nil cancelButtonTitle:@"Again" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if (self.BoolHearth==3){
        [self Finish];
        if(self.WatchValue*10>[[NSUserDefaults standardUserDefaults]integerForKey:@"HighScore"]){
            [[NSUserDefaults standardUserDefaults]setInteger:self.WatchValue*10 forKey:@"HighScore"];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"New Record!!" message:[NSString stringWithFormat:@"Congratulations \nYour new Record: %i",self.pointNumber*10] delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
            [alert show];
        }
        else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Game Over!!" message:[NSString stringWithFormat:@"Your point is : %i",self.pointNumber*10] delegate:nil cancelButtonTitle:@"Again" otherButtonTitles:nil, nil];
            [alert show];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
}
-(void)Start{
    
    self.pointLabel.hidden=NO;
    self.FirstPoint.hidden=NO;
    self.imageview.hidden=NO;
    self.buttonA.hidden=NO;
    self.buttonB.hidden=NO;
    self.buttonC.hidden=NO;
    self.buttonD.hidden=NO;
    self.infoButtonOutlet.hidden=NO;
    self.restartButton.hidden=YES;
    self.starOne.hidden=NO;
    self.starThree.hidden=NO;
    self.starTwo.hidden=NO;
    self.hearthOne.hidden=NO;
    self.hearthTwo.hidden=NO;
    self.hearthThree.hidden=NO;
    self.Buttonstart.hidden=YES;

}
-(void)Finish{
    
    self.pointLabel.hidden=YES;
    self.places=nil;
    self.FirstPoint.hidden=YES;
    self.imageview.hidden=YES;
    self.buttonA.hidden=YES;
    self.buttonB.hidden=YES;
    self.buttonC.hidden=YES;
    self.buttonD.hidden=YES;
    self.infoButtonOutlet.hidden=YES;
    self.restartButton.hidden=NO;
    self.starOne.hidden=YES;
    self.starThree.hidden=YES;
    self.starTwo.hidden=YES;
    self.hearthOne.hidden=YES;
    self.hearthTwo.hidden=YES;
    self.hearthThree.hidden=YES;
    self.StartButton.hidden=NO;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SettingIdentifier"]){

    }

}
- (IBAction)ExitButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(BOOL)CheckChoose{
    if([self.buttonA.currentTitle isEqual:self.buttonB.currentTitle]){

        return YES;
    }
    else if ([self.buttonA.currentTitle isEqual:self.buttonC.currentTitle]){

        return YES;
    }
    else if ([self.buttonA.currentTitle isEqual:self.buttonD.currentTitle]){

        return YES;
    }
    else if ([self.buttonB.currentTitle isEqual:self.buttonC.currentTitle]){

        return YES;
    }
    else if ([self.buttonB.currentTitle isEqual:self.buttonD.currentTitle]){

        return YES;
    }
    else if ([self.buttonC.currentTitle isEqual:self.buttonD.currentTitle]){

        return YES;
    }
    else{

        return NO;
    }

}
-(void)setScore{
    

}
@end
