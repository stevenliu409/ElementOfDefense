//
//  logingLayer.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-25.
//
//

#import "logingLayer.h"
#import "cocos2d.h"
#import "labelHelper.h"
#import "textFieldMaker.h"
#import "shopLayer.h"
#import "loadingLayer.h"
#import "monster.h"
#import "body.h"
#import "testRLeg.h"
@implementation logingLayer

+(CCScene*) scene{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
        
    // 'layer' is an autorelease object.
    logingLayer *layer = [logingLayer node];
        
        // add layer as a child to scene
    [scene addChild: layer];
        
        // return the scene
    return scene;
}

-(id) init{
    if(self = [super init]){
        [self initData];
        [self initBg];
        [self initLabel];
        [self initButtons];
        if(user!=NULL){
            [self loginUser:user];
        }
        
        monster* m1 = [monster makeMonster:[body makeBody:@"body.png"] mhead:[body makeBody:@"head.png"] mrleg:[testRLeg makeTestRLeg:@"rleg_1.png" fromFile:@"walkRleg"] mlleg:[testRLeg makeTestRLeg:@"lleg_1.png" fromFile:@"walkLleg"]];
        //[m1 setPosition:CGPointMake(200, 200)];
        m1.mbody.flipX = YES;
        m1.mhead.flipX = YES;
        [m1 setUpPos:100 yPos:100];
        [self addChild:m1 z:3];
    }
    return self;
}

-(void) initData{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"mlist.plist"];
    
    [[CCSpriteFrameCache sharedSpriteFrameCache]
     addSpriteFramesWithFile:@"scene1atlasiPhone.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"testAltas_default.plist"];
    prefs = [NSUserDefaults standardUserDefaults];
    user = [prefs objectForKey:@"currentUser"];
    if(user!= NULL){
        totalTime = [user objectForKey:@"totalTime"];
        monsters = [[user objectForKey:@"totalMonsters"]intValue];
        //tempScore = [self calculateScore];
        totalScore = [[user objectForKey:@"userScore"]intValue];
    }
}

-(int) calculateScore{
    
    if(totalTime == NULL){
        return 0;
    }
    return 1000;
}

-(void) initBg{
    size = [[CCDirector sharedDirector] winSize];
    CCSprite* bg = [CCSprite spriteWithFile:@"openbg.jpg"];
    bg.anchorPoint = ccp(0,0);
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    [self addChild:bg z:1];
    txtEmail = [textFieldMaker getTextField:175 y:120 height:200 width:30 gate:self];
    [[[CCDirector sharedDirector] view]addSubview:txtEmail];
    
}
-(void) initLabel{
    
    titleLabel = [labelHelper makeLabel:@"Leo's zombie defense" layer:self position:CGPointMake(size.width/2, size.height*3/4) fontsize:30 zValue:2];
    titleLabel.color = ccRED;
    
    
    enterLabel = [labelHelper makeLabel:@"Please enter your Email address" layer:self position:CGPointMake(size.width/2, size.height*4/5) fontsize:30 zValue:2];
    enterLabel.visible = NO;
    
    idLabel = [labelHelper makeLabel:@"" layer:self position:CGPointMake(20,size.height*4/5+20) fontsize:25 zValue:2];
    idLabel.visible = NO;
    idLabel.anchorPoint = ccp(0,0.5);
    
    scoreLabel = [labelHelper makeLabel:@"" layer:self position:CGPointMake(20, idLabel.position.y - 50) fontsize:25 zValue:2];
    scoreLabel.visible = NO;
    scoreLabel.anchorPoint= ccp(0,0.5);
    
    levelLabel = [labelHelper makeLabel:@"" layer:self position:CGPointMake(20, idLabel.position.y - 100) fontsize:25 zValue:2];
    levelLabel.visible = NO;
    levelLabel.anchorPoint = ccp(0,0.5);
    
    rScoreLabel = [labelHelper makeLabel:@""layer:self position:ccp(20,idLabel.position.y - 215) fontsize:20 zValue:2];
    rScoreLabel.anchorPoint = ccp(0,0.5);
    
    rTimeLabel = [labelHelper makeLabel:@"" layer:self position:ccp(20,idLabel.position.y - 145) fontsize:20 zValue:2];
    rTimeLabel.anchorPoint = ccp(0,0.5);
    rTimeLabel.color = ccRED;
    
    rMonsterLabel = [labelHelper makeLabel:@"" layer:self position:ccp(20,idLabel.position.y - 180) fontsize:20 zValue:2];
    rMonsterLabel.anchorPoint = ccp(0,0.5);
    
  
    
    if(user == NULL){
        [self setRercodLabelTo:NO];
    }
    
    
    
}

-(void) setRercodLabelTo:(BOOL) b{
    rTimeLabel.visible = b;
    rMonsterLabel.visible = b;
    rScoreLabel.visible = b;
}

-(void) initButtons{
    CCMenuItem* loginCurrentAccount = [CCMenuItemFont itemWithString:@"login" target:self selector:@selector(login:)];
    CCMenuItem* login = [CCMenuItemFont itemWithString:@"Create a new Account" target:self selector:@selector(newAccount:)];
    buttonMenu = [CCMenu menuWithItems:loginCurrentAccount, login,nil];
    buttonMenu.position = ccp(size.width/2,size.height/2);
    [buttonMenu alignItemsVertically];
    [self addChild:buttonMenu z:2];
    
    [CCMenuItemFont setFontSize:20];
    CCMenuItem* mLogout = [CCMenuItemFont itemWithString:@"Log Out" target:self selector:@selector(goBack:)];
    CCMenuItem* mShop = [CCMenuItemFont itemWithString:@"Go Shop" target:self selector:@selector(goShop:)];
    CCMenuItem* mChoose = [CCMenuItemFont itemWithString:@"Choose the Level" target:self selector:@selector(chooseLevel:)];
    CCMenuItem* mGoNextLevel = [CCMenuItemFont itemWithString:@"Go next Level" target:self selector:@selector(goNext:)];
    adminMenu = [CCMenu menuWithItems:mLogout,mShop,mChoose,mGoNextLevel, nil];
    //[adminMenu alignItemsVertically];
    adminMenu.anchorPoint = ccp(0,0);
    adminMenu.position = ccp(0,20);
    mLogout.position = ccp(30,0);
    mShop.position = ccp(mLogout.position.x + 100,0);
    mChoose.position = ccp(mShop.position.x + 150,0);
    mGoNextLevel.position = ccp(mChoose.position.x + 150,0);
    adminMenu.visible = NO;
    [self addChild:adminMenu z:2];
    
    
    [CCMenuItemFont setFontSize:25];
    CCMenuItem* mBack = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(goBack:)];
    mBack.position = ccp(size.width -50,40);
    backMenu = [CCMenu menuWithItems:mBack, nil];
    backMenu.position = ccp(0,0);
    backMenu.visible = NO;
    [self addChild:backMenu z:2];
    
}

-(void) goBack:(id) sender{
    [prefs setObject:NULL forKey:@"currentUser"];
    [prefs synchronize];
    [self setRercodLabelTo:NO];
    adminMenu.visible = NO;
    idLabel.visible = NO;
    scoreLabel.visible = NO;
    levelLabel.visible = NO;
    
    titleLabel.visible = YES;
    buttonMenu.visible = YES;
    
    
    enterLabel.visible = NO;
    
    txtEmail.hidden = YES;
    
    backMenu.visible = NO;
    
}

-(void) goShop:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"openbg.jpg" from:996 to:997]];
}

-(void) chooseLevel:(id) sender{
    [[CCDirector sharedDirector]replaceScene:[loadingLayer loadSence:@"openbg.jpg" from:999 to:998]];
}

-(void) goNext:(id) sender{
    
}

-(void) newAccount:(id)sender{
    [self changeLabel:NO elable:YES];
    buttonMenu.visible = NO;
    txtEmail.hidden = NO;
    createNew = YES;
    backMenu.visible = YES;
    
}
-(void) login:(id) sender{
    [self changeLabel:NO elable:YES];
    buttonMenu.visible = NO;
    txtEmail.hidden = NO;
    createNew = NO;
    backMenu.visible = YES;
}

-(void) changeLabel:(BOOL) b elable:(BOOL) b1{
    titleLabel.visible = b;
    enterLabel.visible = b1;
}

-(BOOL) textFieldShouldReturn:(UITextField*) textField{
    [textField endEditing:YES];
    NSString* str = txtEmail.text;
    if(![self validateEmailWithString:str]){
        UIAlertView* alter = [[UIAlertView alloc]initWithTitle:@"invaild email address" message:@"you need enter vaild Email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
        return YES;
    }
    [self processUser:str];
    return YES;
}

-(void) processUser:(NSString*) str{    
    NSDictionary* us = [prefs objectForKey:@"users"];
    users = [NSMutableDictionary dictionaryWithDictionary:us];
    NSDictionary* d = [users objectForKey:str];
    if(d != NULL){
        if(!createNew){
            
            [self loginUser:d];
            
            return;
        }
        
        UIAlertView* alter = [[UIAlertView alloc]initWithTitle:@"User already exist" message:@"Please enter a different address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
        txtEmail.text = @"";
        return;
    }else{
        if(!createNew){
            UIAlertView* alter = [[UIAlertView alloc]initWithTitle:@"User donesn't exist" message:@"Please enter a different address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alter show];
            txtEmail.text = @"";
            return;
        }
    }
    
    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setObject:str forKey:@"userID"];
    [dic setObject:[NSNumber numberWithInt:0] forKey:@"userScore"];
    [dic setObject:[NSNumber numberWithInt:1] forKey:@"currentLevel"];
    [dic setObject:[NSNumber numberWithInt:0] forKey:@"totalTime"];
    [dic setObject:[NSNumber numberWithInt:0] forKey:@"totalMonsters"];
    [dic setObject:[NSNumber numberWithInt:0] forKey:@"tempScore"];
    [users setObject:dic forKey:str];
    [prefs setObject:users forKey:@"users"];
    [prefs synchronize];
    
    [self loginUser:dic];
}

-(void) loginUser:(NSDictionary*) dic{
    [self clearScreen];
    [self changeLabel:NO elable:NO];
    buttonMenu.visible = NO;
    if(users == NULL){
        NSDictionary* us = [prefs objectForKey:@"users"];
        users = [NSMutableDictionary dictionaryWithDictionary:us];
    }
    NSString* uid = [dic objectForKey:@"userID"];
    [users setObject:dic forKey:uid];
    [prefs setObject:users forKey:@"users"];
    [prefs setObject:dic forKey:@"currentUser"];
    [prefs synchronize];
    
    
    idLabel.visible = YES;
    [idLabel setString:[NSString stringWithFormat:@"User ID: %@", [dic objectForKey:@"userID"]]];
    
    scoreLabel.visible = YES;
    int ss = [[dic objectForKey:@"userScore"]intValue];
    [scoreLabel setString:[NSString stringWithFormat:@"User Score: %d", ss]];
    
    levelLabel.visible = YES;
    int l = [[dic objectForKey:@"currentLevel"]intValue];
    [levelLabel setString:[NSString stringWithFormat:@"User current at Level: %d", l]];
    
    adminMenu.visible = YES;
    backMenu.visible = NO;
    logedin = YES;
    
    [self setRercodLabelTo:YES];
    
    int t = [[dic objectForKey:@"totalTime"]intValue];
    [rTimeLabel setString:[NSString stringWithFormat:@"The time you use in previous level is %d", t]];
    
    int m = [[dic objectForKey:@"totalMonsters"]intValue];
    [rMonsterLabel setString:[NSString stringWithFormat:@"The monster die in previous level is %d", m]];
    
    int s = [[dic objectForKey:@"tempScore"] intValue];
    [rScoreLabel setString:[NSString stringWithFormat:@"The score you earn %d",s]];
}

-(void) clearScreen{
    txtEmail.hidden = YES;
    enterLabel.visible = NO;
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}





@end
